## ---------------------------
##
## Script name: full_zip_ssvs.R
##
## Purpose of script: performs effect selection in zip model for patent data on basis of the NBPSS prior
##
## Author: Manuel Carlan
##
## Date Created: 2018-08-11
##
## Email: mcarlan@uni-goettingen.de
##
## ---------------------------
## https://projecteuclid.org/journals/bayesian-analysis/volume-16/issue-2/Bayesian-Effect-Selection-in-Structured-Additive-Distributional-Regression-Models/10.1214/20-BA1214.full

library(sdPrior)
library(MASS)
library(doParallel)

alpha <- 0.05
ct  <- 0.1

source("/home/mcarlan/VarSel/rcode/hyper.R")
mainpath <- "/home/mcarlan/VarSel/patent/"
datapath <- "./data/"
prgpath <- paste0("./prg/full_zip_ssvs_alpha",alpha,"/")

dat <- read.table(paste0(datapath,"patent.raw"), header=T)

resultspath <- paste0("./results/full_zip_ssvs_alpha",alpha,"/")

batchname <- "full_zip_ssvs"
seedrepl <- 123

y <- dat["ncit"]
X <- dat[ ,!(colnames(dat) == "ncit")]

# Variables ending with s are standardized, variables ending with n are effect coded
# smooth effects considered
smEffs <- c("years", "ncountrys", "nclaimss")
# linear effects considered
linEffs <- c(smEffs,"ustwin", "opp", "biopharm", "patus", "patgsgr")

# specify equal predictors for  lambda and pi
linEffPi <- linEffLambda <- linEffs
smEffPi <- smEffLambda <- smEffs

effs <- unique(c(linEffLambda, linEffPi, smEffLambda, smEffPi))



# hyper parameter elicitation procedure
# generate design and precision matrices for smooth effects
sm <- dat[smEffs]
zs <- lapply(lapply(sm, DesignM), "[[", "Z_B")
ks <- lapply(lapply(sm, DesignM), "[[", "Kmatrix")

smHyperpars <- linHyperpars <- list()

# elictate smooth hyperparameters
for(i in 1:length(zs)){
  smHyperpars[[i]] <- hyper(Z = zs[[i]], Kinv = ginv(ks[[i]]), a=5,c=ct,alpha1=alpha,alpha2=alpha,R=1e4,myseed=1223)
}


# elicitate linear hyperparameters
lin <- dat[linEffs]
for(i in 1:length(linEffs)){
  linHyperpars[[i]] <- hyper(Z = lin[,i], Kinv = ginv(1), a=5,c=ct,alpha1=alpha,alpha2=alpha,R=1e4,myseed=1223)
}

hyperparams <- list(linHyperpars, smHyperpars)
save(hyperparams, file=paste0("/home/mcarlan/VarSel/patent/patent_hyperpars_alpha",alpha,".RData"))

#load(paste0("/home/mcarlan/VarSel/patent/patent_hyperpars_alpha",alpha,".RData"))

linHyperpars <- hyperparams[[1]]
smHyperpars <- hyperparams[[2]]


get_batchfiles <- function(datapath, prgpath, resultspath, batchname,y,X, seed)
{
  k <- length((effs))
  prgname <- paste(prgpath , batchname,  ".prg", sep="")
  dir.create(prgpath, recursive = TRUE, showWarnings = F)
  
  prog <- prgname
  write(NULL,prog)
  write(paste("% usefile ", prgname,sep=""),prog)
  write(paste(""),prog,append=TRUE)
  
  write(paste("logopen using ", resultspath, "full_zip.log", sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("dataset d",sep=""),prog,append=TRUE)
  write(paste("d.infile using ", datapath, "patent.raw",sep=""),prog,append=TRUE)
  
  
  write(paste(""),prog,append=TRUE)
  
  write(paste(""),prog,append=TRUE)
  
  write(paste(""),prog,append=TRUE)
  write(paste("delimiter=;"),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("mcmcreg m;",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  
  
  write(paste(""),prog,append=TRUE)
  write(paste("m",".outfile = ",resultspath,"/pi;",sep=""),prog,append=TRUE)
  write(paste("m",".hregress ncit"," = const + ", paste0(linEffPi[1:length(linEffPi)], "(ssvs, gig, nocenter, v1 = 5, v2 = " ,sapply(linHyperpars, "[", "b")[1:length(linEffPi)], ", r = " ,sapply(linHyperpars, "[", "r")[1:length(linEffPi)], ",ssvsupdate=gibbs)", collapse = "+ \n ")
              ,"+ ", paste0(smEffPi[1:length(smEffPi)], "(pspline, prior = ssvs, v1 = 5, v2 = " ,sapply(smHyperpars, "[", "b")[1:length(smEffPi)], ",r = " ,sapply(smHyperpars, "[", "r")[1:length(smEffPi)], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")               #,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatb, ",r = ", spatr, ",ssvsupdate=gibbs)")
              ,", family=zip iterations=12000 burnin=2000 step=10 equationtype=pi using d; \n",sep=""),prog,append=TRUE)
  
  write(paste(""),prog,append=TRUE)
  write(paste("m",".outfile = ",resultspath,"/lambda;",sep=""),prog,append=TRUE)
  write(paste("m",".hregress ncit"," = const + ", paste0(linEffLambda[1:length(linEffLambda)], "(ssvs, gig, nocenter, v1 = 5, v2 = " ,sapply(linHyperpars, "[", "b")[1:length(linEffLambda)], ", r = " ,sapply(linHyperpars, "[", "r")[1:length(linEffLambda)], ",ssvsupdate=gibbs)", collapse = "+ \n ")
              ,"+ ", paste0(smEffLambda[1:length(smEffLambda)], "(pspline, prior = ssvs, v1 = 5, v2 = " ,sapply(smHyperpars, "[", "b")[1:length(smEffLambda)], ",r = " ,sapply(smHyperpars, "[", "r")[1:length(smEffLambda)], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")               #,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatb, ",r = ", spatr, ",ssvsupdate=gibbs)")
              ,", family=zip predict = light setseed=", seed," equationtype=lambda using d; \n",sep=""),prog,append=TRUE)
  
  write(paste("m",".getsample;",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("m",".autocor;",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("drop m",";",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("drop d;",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("logclose;"),prog,append=TRUE)
  
}  



dir.create(resultspath, showWarnings = TRUE, recursive = T)

get_batchfiles(datapath = datapath, prgpath = prgpath, resultspath = resultspath, batchname = batchname, seed=123,  y = y, X = X)

system(paste('"/home/mcarlan/bayesx/trunk/bayesx"',paste(prgpath, batchname, ".prg",sep="")))


