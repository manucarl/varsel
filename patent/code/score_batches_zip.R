## ---------------------------
##
## Script name: score_batches_zip.R
##
## Purpose of script: performs cross validation for zip model for patent data
## Author: Manuel Carlan
##
## Date Created: 2018-07-15
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


source("patent/rcode/hyper.R")
mainpath <- "patent/"
datapath <- "patent/data/"
dat <- read.table(paste0(datapath,"patent.raw"), header=T)

prgpath <- "patent/prg/score_batches_zip"
resultspath <- "patent/results/score_batches_zip/"

batchname <- "predict"
seedrepl <- 123




# script that produces .prg file for BayesX
get_batchfiles <-  function(datapath,
                            prgpath,
                            resultspath,
                            batchname,
                            seed,
                            i)
  {
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
    write(paste("d.drop if nclaims >50"), prog, append = TRUE)
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
        " = const + nclaims+ opp+ biopharm + patgsgr +
 ncountrys(pspline, a=0.0001, b=0.0001)+
 years(pspline, a=0.0001, b=0.0001) weight w",
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
        " = const + opp+ biopharm + patgsgr +
 ncountrys(pspline, a=0.0001, b=0.0001)+
 years(pspline, a=0.0001, b=0.0001)+
 nclaimss(pspline, a=0.0001, b=0.0001) weight w",
        i,
        ",setseed=",
        i,
        "123 family=zip predict = light equationtype=lambda using d; \n",
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
  dir.create(resultspath, showWarnings = F, recursive = T)
  
  get_batchfiles(
    datapath = datapath,
    prgpath = prgpath,
    resultspath = resultspath,
    batchname = batchname,
    seed = seedrepl ,
    i
  )
  
  system(paste(
    '"/home/mcarlan/bayesx/trunk/bayesx"',
    paste(prgpath, "predict", i, ".prg", sep = "")
  ))
  
  return(NULL)
}

res <- mclapply(1:10, FUN = runbatches, mc.cores = 10)
