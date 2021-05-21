## ---------------------------
##
## Script name: score_batches_zip_ssvs.R
##
## Purpose of script: performs cross validation for zip model for patent data on basis of NBPSS prior
## Author: Manuel Carlan
##
## Date Created: 2018-05-10
##
## Email: mcarlan@uni-goettingen.de
##
## Notes: must set mc.cores=1 on windows,
##        must adapt file paths
## ---------------------------
## ## https://projecteuclid.org/journals/bayesian-analysis/volume-16/issue-2/Bayesian-Effect-Selection-in-Structured-Additive-Distributional-Regression-Models/10.1214/20-BA1214.full

library(sdPrior)
library(MASS)
library(doParallel)

alpha <- 0.05
ct  <- 0.1
seed <- 123

 source("patent/rcode/hyper.R")
mainpath <- "patent/"
datapath <- "patent/data/"
dat <- read.table(paste0(datapath,"patent.raw"), header=T)

prgpath <- paste0("./prg/score_batches_zip_ssvs_alpha",alpha, "/")
resultspath <- paste0(mainpath, "results/score_batches_zip_ssvs_alpha", alpha, "/")

batchname <- "predict"
seedrepl <- 12

y <- dat["ncit"]
X <- dat[ ,!(colnames(dat) == "ncit")]

# Variables ending with s are standardized 
smEffs <- c("years", "ncountrys", "nclaimss")
linEffs <- c(smEffs,"ustwin", "opp",  "biopharm", "patus", "patgsgr")

# set predictors for pi and lambda
linEffPi <- linEffLambda <- linEffs
smEffPi <- smEffLambda <- smEffs

effs <- unique(c(linEffLambda, linEffPi, smEffLambda, smEffPi))

sm <- dat[smEffs]
zs <- lapply(lapply(sm, DesignM), "[[", "Z_B")
ks <- lapply(lapply(sm, DesignM), "[[", "Kmatrix")
    
# hyperparameter elicitation
# smooth
smHyperpars <- linHyperpars <- list()

for(i in 1:length(zs)){
  smHyperpars[[i]] <- hyper(Z = zs[[i]], Kinv = ginv(ks[[i]]), a=5,c=ct,alpha1=alpha,alpha2=alpha,R=1e4,myseed=1223)
}

# linear
lin <- dat[linEffs]
    
for(i in 1:length(linEffs)){
  linHyperpars[[i]] <- hyper(Z = lin[,i], Kinv = ginv(1), a=5,c=ct,alpha1=alpha,alpha2=alpha,R=1e4,myseed=1223)
}

hyperparams <- list(linHyperpars, smHyperpars)
#store if needed
# save(hyperparams, file=paste0("/home/mcarlan/VarSel/patent/scores_patent_hyperpars_alpha",alpha,"_c", ct,".RData"))
# load if needed
#load(paste0("/home/mcarlan/VarSel/patent/scores_patent_hyperpars_alpha",alpha,"_c", ct,".RData"))

linHyperpars <- hyperparams[[1]]
smHyperpars <- hyperparams[[2]]


# script that produces .prg file for BayesX with plugged in elicitated hyperparameters
get_batchfiles <-
  function(datapath,
           prgpath,
           resultspath,
           batchname,
           seed,
           i,
           y,
           X)
  {
    k <- length((effs))
    prgname <- paste(prgpath , batchname, i, ".prg", sep = "")
    dir.create(prgpath, recursive = TRUE, showWarnings = F)
    
    prog <- prgname
    write(NULL, prog)
    write(paste("% usefile ", prgname, sep = ""), prog)
    write(paste(""), prog, append = TRUE)
    
    write(paste("logopen using ", resultspath, ".log", sep = ""),
          prog,
          append = TRUE)
    write(paste(""), prog, append = TRUE)
    write(paste("dataset d", sep = ""), prog, append = TRUE)
    write(paste("d.infile using ", datapath, "/patent.raw", sep = ""),
          prog,
          append = TRUE)
    
    write(paste(""), prog, append = TRUE)
    
    write(paste(""), prog, append = TRUE)
    write(paste("delimiter=;"), prog, append = TRUE)
    write(paste(""), prog, append = TRUE)
    write(paste("mcmcreg m", i, ";", sep = ""), prog, append = TRUE)
    write(paste(""), prog, append = TRUE)
    
    
    write(paste(""), prog, append = TRUE)
    write(paste("m", i, ".outfile = ", resultspath, "/pi;", sep = ""),
          prog,
          append = TRUE)
    write(
      paste(
        "m",
        i,
        ".hregress ncit",
        " = const + ",
        paste0(
          linEffPi[1:length(linEffPi)],
          "(ssvs, gig, v1 = 5, v2 = " ,
          sapply(linHyperpars, "[", "b")[1:length(linEffPi)],
          ", r = " ,
          sapply(linHyperpars, "[", "r")[1:length(linEffPi)],
          ",nocenter,ssvsupdate=gibbs)",
          collapse = "+ \n "
        )
        ,
        "+ ",
        paste0(
          smEffPi[1:length(smEffPi)],
          "(pspline, prior = ssvs, v1 = 5, v2 = " ,
          sapply(smHyperpars, "[", "b")[1:length(smEffPi)],
          ",r = " ,
          sapply(smHyperpars, "[", "r")[1:length(smEffPi)],
          ",ssvsupdate=gibbs, centermethod=nullspace)",
          collapse = "+ \n"
        )               #,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatb, ",r = ", spatr, ",ssvsupdate=gibbs)")
        ,
        " weight w",
        i,
        ", family=zip iterations=12000 burnin=2000 step=10 equationtype=pi using d; \n",
        sep = ""
      ),
      prog,
      append = TRUE
    )
    
    write(paste(""), prog, append = TRUE)
    write(paste("m", i, ".outfile = ", resultspath, "/lambda;", sep = ""),
          prog,
          append = TRUE)
    write(
      paste(
        "m",
        i,
        ".hregress ncit",
        " = const + ",
        paste0(
          linEffLambda[1:length(linEffLambda)],
          "(ssvs, gig,  prior=ssvs, v1 = 5, v2 = " ,
          sapply(linHyperpars, "[", "b")[1:length(linEffLambda)],
          ", r = " ,
          sapply(linHyperpars, "[", "r")[1:length(linEffLambda)],
          ",nocenter,ssvsupdate=gibbs)",
          collapse = "+ \n "
        )
        ,
        "+ ",
        paste0(
          smEffLambda[1:length(smEffLambda)],
          "(pspline, prior = ssvs, v1 = 5, v2 = " ,
          sapply(smHyperpars, "[", "b")[1:length(smEffLambda)],
          ",r = " ,
          sapply(smHyperpars, "[", "r")[1:length(smEffLambda)],
          ",ssvsupdate=gibbs, centermethod=nullspace)",
          collapse = "+ \n"
        )               #,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatb, ",r = ", spatr, ",ssvsupdate=gibbs)")
        ,
        " weight w",
        i,
        ",family=zip predict = light setseed=",
        paste0(seed, i),
        " equationtype=lambda using d; \n",
        sep = ""
      ),
      prog,
      append = TRUE
    )
    
    write(paste("m", i, ".getsample;", sep = ""), prog, append = TRUE)
    write(paste(""), prog, append = TRUE)
    write(paste("m", i, ".autocor;", sep = ""), prog, append = TRUE)
    write(paste(""), prog, append = TRUE)
    write(paste("drop m", i, ";", sep = ""), prog, append = TRUE)
    write(paste(""), prog, append = TRUE)
    write(paste("drop d;", sep = ""), prog, append = TRUE)
    write(paste(""), prog, append = TRUE)
    write(paste("logclose;"), prog, append = TRUE)
    
  }  
  


# produce scripts and pass to BayesX
runbatches <- function(i) {
  resultspath <- paste0(resultspath, "predict", i)
  dir.create(resultspath, showWarnings = TRUE, recursive = T)
  
  get_batchfiles(
    datapath = datapath,
    prgpath = prgpath,
    resultspath = resultspath,
    batchname = batchname,
    seed = seedrepl,
    i,
    y = y,
    X = X
  )
  system(paste(
    '"/home/mcarlan/bayesx/trunk/bayesx"',
    paste(prgpath, "predict", i, ".prg", sep = "")
  ))
  
  return(NULL)
}

res <- mclapply(1:10, FUN = runbatches, mc.cores = 10)
