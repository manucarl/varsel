## ---------------------------
##
## Script name: run_sims.R
##
## Purpose of script: performs effect selection on basis of the NBPSS prior with BayesX for simulated Gaussian mean data
## Author: Manuel Carlan
##
## Date Created: 2021-05-1
##
## Email: mcarlan@uni-goettingen.de
##
## ---------------------------

#load libraries
library(doParallel)
library(sdPrior)
library(MASS)
library(BayesX)
options(scipen=999)

rm(list = ls())
seed <- 22234
set.seed(seed)

# No. of replications
R <- 25

# Low Sparsity
# Sample size 200
# Response Distributions: normal
# - spatial effect
# hyperparameters: optimized for c=0.1, alpha=0.05

scen <- data.frame(sparsity = c("unsparse"),
                   n = c(200),
                   spatial = c(F),
                   cor = c(0),
                   alpha = c(0.05),
                   ct = c(0.1),
                   family = c("normal")
)


#definition of some paths
mainpath <- "/home/mcarlan/VarSel/"

#load additional R files or data if needed
source(paste(mainpath,"rcode/get_batchfiles_all.R", sep = ""))
source(paste(mainpath,"rcode/hyper.R", sep = ""))



# READ simulated data
ifelse(scen$sparsity == "unsparse", k <- 16, k <- 20)
k <- 16

datapath <- paste0(mainpath,"data/", scen$family, "/n", scen$n, "_", scen$sparsity, "_",  ifelse(scen$spatial == T, "spatial", "notspatial"),"_", "cor",scen$cor)


######################################################################################################################################
##### prior elicitation
######################################################################################################################################

dat <- read.table(paste0(datapath, "/data.raw"), header=T)
print(colnames(dat))

# get design matrices and precision matrices 
dat <- dat[colnames(dat) %in% c(paste0("x",1:20),"region")][1:scen$n, ]


zs <- lapply(lapply(dat, DesignM), "[[", "Z_B")
ks <- lapply(lapply(dat, DesignM), "[[", "Kmatrix")

Kmatspat <- read.gra(paste0(mainpath, "spatial/westerngermany.gra"))
#Kmatspat <- read.gra(paste0(mainpath, "spatial/munich_bezt.gra"))

regions <- as.numeric(attr(Kmatspat,"dimnames")[[1]])

Zspat <- matrix(0,scen$n,nrow(Kmatspat))
for(j in 1:nrow(Kmatspat)) {
  Zspat[which(dat$region[1:scen$n]==regions[j]),j] <- 1
}
kslin <- diag(22)

params <- linparams <- list()
hypSm <- function(i){
  params <- hyper(Z = zs[[i]], Kinv = ginv(ks[[i]]), a=5,c=scen$ct,alpha1=scen$alpha,alpha2=scen$alpha,R=1e4,myseed=1223)
  return(params)
}
params <- try(mclapply(1:k, FUN = hypSm, mc.cores = k))
print(params)

hypLin <- function(i){
  linparams <- hyper(Z=matrix(dat[,i], ncol=1), Kinv = ginv(1), a = 5, c = scen$ct, alpha1 = scen$alpha, alpha2 = scen$alpha, R=1e4, myseed = seed)
  return(linparams)
}
linparams <- try(mclapply(1:k, FUN = hypLin, mc.cores = k))
print(linparams)

spatparams <- hyper(Z = Zspat, Kinv = ginv(Kmatspat) ,a=5,c=scen$ct,alpha1=scen$alpha,alpha2=scen$alpha,R=1e4,myseed=1223)
print(spatparams)


runall <- function(repl) {
  
  set.seed(repl)
  seedrepl <- sample(1:999, size = 1)
  
  batchname <- paste("y_", repl, sep = "")
  
  resultspath <- paste(mainpath,"results/",scen$family, "/n", scen$n, "_", scen$sparsity, "_", ifelse(scen$spatial == T, "spatial", "notspatial"),"_", "cor",scen$cor,   "_alpha", scen$alpha, "_c", scen$ct,
                       "/",batchname, sep = "")
  dir.create(resultspath, showWarnings = T, recursive = T)
  prgpath <- paste(mainpath,"prg/",scen$family, "/n", scen$n, "_", scen$sparsity, "_", ifelse(scen$spatial == T, "spatial", "notspatial"),"_", "cor",scen$cor,   "_alpha", scen$alpha, "_c", scen$ct,
                   "/", sep = "")
  dir.create(prgpath, showWarnings = T, recursive = T)
  
  setwd(paste(resultspath, sep = ""))
  
  # generate BayesX scripts
  get_batchfiles(datapath, prgpath, resultspath, batchname,  repl=repl,seedrepl = seedrepl, scen, n = scen$n, smHyperpars = params, linHyperpars = linparams, spatHyperpars = spatparams)
  
  
  # pass script to BayesX
  system(paste('"/home/mcarlan/bayesx/trunk/bayesx"',paste(prgpath, batchname, ".prg",sep="")))
  

  desc <- "_MAIN_mu_REGRESSION_y"
  res <- vector("list",16)
  
  lin <- read.table(paste(resultspath, "/", batchname, desc ,repl,"_LinearEffects_ssvs_delta.res", sep = ""), header = TRUE)
  res$lin <- lin	 
  
  
  for (i in (1:16)) {
    psp <- read.table(paste(resultspath, "/", batchname, desc ,repl,"_nonlinear_pspline_effect_of_",paste("x",i, sep = ""),".res", sep = ""), header = TRUE)
    res[[i]]$psp <- psp$pmean
    res[[i]]$psp.l <- psp$pqu2p5
    res[[i]]$psp.u <- psp$pqu97p5
    res[[i]]$x <- psp[,paste0("x",i)]
    
    
    spat <- read.table(paste(resultspath, "/", batchname, desc ,repl,"_spatial_MRF_effect_of_region.res", sep = ""), header = TRUE)
    res[[i]]$region <- spat$region
    res[[i]]$spat <- spat$pmean
    res[[i]]$spat.l <- spat$pqu2p5
    res[[i]]$spat.u <- spat$pqu97p5
    
    psp.delta <- read.table(paste(resultspath, "/", batchname, desc ,repl,"_variance_of_nonlinear_pspline_effect_of_",paste("x",i, sep = ""),"_delta.res", sep = ""), header = TRUE)
    res[[i]]$psp.delta <- psp.delta$pmean
    psp.delta.p <- read.table(paste(resultspath, "/", batchname, desc ,repl,"_variance_of_nonlinear_pspline_effect_of_",paste("x",i, sep = ""),"_delta_prob.res", sep = ""), header = TRUE)
    res[[i]]$psp.delta.p <- psp.delta.p$pmean
    
    
    spat.delta <- read.table(paste(resultspath, "/", batchname, desc ,repl,"_variance_of_spatial_MRF_effect_of_region_delta.res", sep = ""), header = TRUE)
    res$spat.delta <- spat.delta$pmean
    spat.delta.p <- read.table(paste(resultspath, "/", batchname, desc ,repl,"_variance_of_spatial_MRF_effect_of_region_delta_prob.res", sep = ""), header = TRUE)
    res$spat.delta.p <- spat.delta.p$pmean
  }
  
  if(scen$family == "gaussian"){
    
    res$scale <- read.table(paste(resultspath, "/", batchname, desc ,repl,"_scale.res", sep = ""), header = TRUE)
    
  }
  
  res$params <- params
  res$linparams <- linparams
  res$spatparams <- spatparams
  
  res$pred <- read.table(paste(resultspath, "/", batchname, desc ,repl,"_predict.res", sep = ""), header = TRUE)
  res$DIC <- read.table(paste(resultspath, "/", batchname, desc ,repl,"_predict_DIC.res", sep = ""), header = TRUE)
  res$WAIC <- read.table(paste(resultspath, "/", batchname, desc ,repl,"_predict_WAIC.res", sep = ""), header = TRUE)
  
  
  res
  
}   


