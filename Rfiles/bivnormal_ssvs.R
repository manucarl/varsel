library(sdPrior)
library(MASS)
library(doParallel)
library(BayesX)

source(".../Rfiles/hyper.R")


mainpath <- ".../nigeria/" 
datapath <- ".../nigeria/data/" # where map (.bnd) is stored
prgpath <-  ".../nigeria/prg/"

dat <- read.table(paste0(datapath,"nigeria4.raw"), header=T)

# Directory where BayesX results should be stored
resultspath <- ""

# Set seed for BayesX
seedrepl <- 123

X <- dat[ ,!(colnames(dat) %in% c("wasting2","stunting2"))]

# Specify continuous covariates that should be included linearly and nonlinearly
smEffs <- c("mbmi2", "mage2", "cage2", "edupartner2")
# Specify cont. and non-continuous covariates that should be included only linearly
linEffs <- c(smEffs, "csex","electricity", paste0("cbirthorder", 1:7),
			      "munemployed", "mresidence", "car", "motorcycle", "radio",
			      "television", "ctwin", "refrigerator", "bicycle")

# Here we include all possible covariates in all predictors
smEffMu2 <- smEffMu1 <- smEffSigma2 <- smEffSigma1 <- smEffDf <- smEffRho <- smEffs
linEffMu2 <- linEffMu1 <- linEffSigma2 <- linEffSigma1 <-  linEffDf <- linEffRho <- linEffs

###########################################################################################################################
#### Prior elicitation ####################################################################################################
###########################################################################################################################
smHyperpars <- linHyperpars <- spatHyperparams <- list()

### Prior elicitation for smooth effects
sm <- dat[smEffs]

# Construct design matrices for spline
zs <- lapply(lapply(sm, DesignM), "[[", "Z_B")
# Construct P-spline penality matrix
ks <- lapply(lapply(sm, DesignM), "[[", "Kmatrix")
    
# Specify prior probability alpha and threshold c
alpha <- 0.1
ct  <- 0.1

# Simulate prior effects and optimize hyperparameters
for(i in 1:length(zs)){
  smHyperpars[[i]] <- hyper(Z = zs[[i]], Kinv = ginv(ks[[i]]), a=5,c=ct,alpha1=alpha,alpha2=alpha,R=1e4,myseed=1223)
}

### Prior elicitation for spatial effect
# load boundary file
nigeria.bnd <- read.bnd(paste0(datapath,"nigeriamap.bnd"))
# convert to .gra
nigeria.gra <- bnd2gra(nigeria.bnd)

regions <- as.numeric(attr(nigeria.gra,"dimnames")[[1]])

# Construct design matrix
Zspat <- matrix(0,nrow(dat),nrow(nigeria.gra))
for(j in 1:nrow(nigeria.gra)) {
    Zspat[which(dat$subregion==regions[j]),j] <- 1
}

# Specify prior probability alpha and threshold c
alpha <- 0.1
ct  <- 0.1

# Simulate prior effect and optimize hyperparameters
spatHyperparams <- hyper(Z = Zspat, Kinv = ginv(nigeria.gra) ,a=5,c=ct,alpha1=alpha,alpha2=alpha,R=1e4,myseed=1223)


### Prior elicitation for linear effects

lin <- dat[linEffs]

# Specify prior probability alpha and threshold c
alpha <- 0.1
ct  <- 0.1

# Simulate prior effect and optimize hyperparameters    
for(i in 1:length(linEffs)){
   linHyperpars[[i]] <- hyper(Z = lin[,i], Kinv = ginv(1), a=5,c=ct,alpha1=alpha,alpha2=alpha,R=1e4,myseed=1223)
}

hyperparams <- list(linHyperpars, smHyperpars, spatHyperparams )

# If you want to save/load hyperparameters
#save(hyperparams, file=paste0(".../nigeria/hyperp_", alpha, "_c",ct,".RData"))
#load(paste0(".../nigeria/hyperp_", alpha, ".RData"))

linHyperpars <- hyperparams[[1]]
smHyperpars <- hyperparams[[2]]
spatHyperpars <- hyperparams[[3]]

# Specify name of BayesX result data and scripts
batchname <- "bivn_ssvs"


dx <- K <- vector("list", length = ncol(dat))

# Function that writes .prg (BayesX script) - Better to run from here
get_batchfiles <- function(datapath, prgpath, resultspath, batchname,seedrepl,i,y,X)
{
  prgname <- paste(prgpath , batchname,  ".prg", sep="")
  dir.create(prgpath, recursive = TRUE, showWarnings = F)
  prog <- prgname
  write(NULL,prog)
  write(paste("% usefile ", prgname,sep=""),prog)
  write(paste(""),prog,append=TRUE)
  write(paste("logopen using ", resultspath, batchname, ".log", sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("dataset d",sep=""),prog,append=TRUE)
  write(paste("d.infile using ", datapath, "nigeria4.raw",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("map ma \n",
             "ma.infile using ",datapath, "nigeriamap.bnd", sep =""), prog, append = TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("delimiter=;"),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("mcmcreg m",i,";",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)

  write(paste(""),prog,append=TRUE)
  write(paste("m",i,".outfile = ",resultspath,"/bivn;",sep=""),prog,append=TRUE)
  write(paste("m",i,".hregress wasting2"," = const + ",
        paste0(linEffRho[1:length(linEffRho)], "(ssvs, gig, nocenter, v1 = 5, v2 = " ,sapply(linHyperpars, "[", "b")[1:length(linEffRho)], ", r = " ,sapply(linHyperpars, "[", "r")[1:length(linEffRho)], ",ssvsupdate=gibbs)", collapse = "+ \n ")
              ,"+ ", paste0(smEffRho[1:length(smEffRho)], "(pspline, prior = ssvs, v1 = 5, v2 = " ,sapply(smHyperpars, "[", "b")[1:length(smEffRho)], ",r = " ,sapply(smHyperpars, "[", "r")[1:length(smEffRho)], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")              
 ,"+ ", paste0( "subregion(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
,", family=bivnormal iterations=12000 burnin=2000 step=10 equationtype=rho setseed=1 using d; \n",sep=""),prog,append=TRUE)

  write(paste("m",i,".hregress stunting2"," = const + ",
        paste0(linEffSigma2[1:length(linEffSigma2)], "(ssvs, gig, nocenter, v1 = 5, v2 = " ,sapply(linHyperpars, "[", "b")[1:length(linEffSigma2)], ", r = " ,sapply(linHyperpars, "[", "r")[1:length(linEffSigma2)], ", ssvsupdate=gibbs)", collapse = "+ \n ")
              ,"+ ", paste0(smEffSigma2[1:length(smEffSigma2)], "(pspline, prior = ssvs, v1 = 5, v2 = " ,sapply(smHyperpars, "[", "b")[1:length(smEffSigma2)], ",r = " ,sapply(smHyperpars, "[", "r")[1:length(smEffSigma2)], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")            
  ,"+ ", paste0( "subregion(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
,", family=bivnormal iterations=12000 burnin=2000 step=10 equationtype=sigma setseed=1 using d; \n",sep=""),prog,append=TRUE)

  write(paste("m",i,".hregress wasting2"," = const + ",
        paste0(linEffSigma1[1:length(linEffSigma1)], "(ssvs, gig, nocenter, v1 = 5, v2 = " ,sapply(linHyperpars, "[", "b")[1:length(linEffSigma1)], ", r = " ,sapply(linHyperpars, "[", "r")[1:length(linEffSigma1)], ", ssvsupdate=gibbs)", collapse = "+ \n ")
              ,"+ ", paste0(smEffSigma1[1:length(smEffSigma1)], "(pspline, prior = ssvs, v1 = 5, v2 = " ,sapply(smHyperpars, "[", "b")[1:length(smEffSigma1)], ",r = " ,sapply(smHyperpars, "[", "r")[1:length(smEffSigma1)], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")               
  ,"+ ", paste0( "subregion(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
, ", family=bivnormal iterations=12000 burnin=2000 step=10 equationtype=sigma setseed=1 using d; \n",sep=""),prog,append=TRUE)

  write(paste("m",i,".hregress stunting2"," = const + ",
        paste0(linEffMu2[1:length(linEffMu2)], "(ssvs, gig, nocenter, v1 = 5, v2 = " ,sapply(linHyperpars, "[", "b")[1:length(linEffMu2)], ", r = " ,sapply(linHyperpars, "[", "r")[1:length(linEffMu2)], ", ssvsupdate=gibbs)", collapse = "+ \n ")
              ,"+ ", paste0(smEffMu2[1:length(smEffMu2)], "(pspline, prior = ssvs, v1 = 5, v2 = " ,sapply(smHyperpars, "[", "b")[1:length(smEffMu2)], ",r = " ,sapply(smHyperpars, "[", "r")[1:length(smEffMu2)], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")        
 ,"+ ", paste0( "subregion(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)") 
, ", family=bivnormal iterations=12000 burnin=2000 step=10 equationtype=mu setseed=1 using d; \n",sep=""),prog,append=TRUE)

  write(paste("m",i,".hregress wasting2"," = const + ",
        paste0(linEffMu1[1:length(linEffMu1)], "(ssvs, gig, nocenter, v1 = 5, v2 = " ,sapply(linHyperpars, "[", "b")[1:length(linEffMu1)], ", r = " ,sapply(linHyperpars, "[", "r")[1:length(linEffMu1)], ", ssvsupdate=gibbs)", collapse = "+ \n ")
              ,"+ ", paste0(smEffMu1[1:length(smEffMu1)], "(pspline, prior = ssvs, v1 = 5, v2 = " ,sapply(smHyperpars, "[", "b")[1:length(smEffMu1)], ",r = " ,sapply(smHyperpars, "[", "r")[1:length(smEffMu1)], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")              
 ,"+ ", paste0( "subregion(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
, ", family=bivnormal iterations=12000 burnin=2000 step=10 equationtype=mu  setseed=1 predict=light using d; \n",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)

  write(paste("m",i,".getsample;",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("m",i,".autocor;",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("drop m",i,";",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("drop d;",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("logclose;"),prog,append=TRUE)
  }  
  
# Write .prg
  get_batchfiles(datapath = datapath, prgpath = prgpath, resultspath = resultspath, batchname = batchname, seedrepl = 1, 1, y = y, X = X)

# Run BayesX on script (need to specify destination of BayesX)
  system(paste('".../bayesx/trunk/bayesx"',paste(prgpath, "bivn_ssvs.prg",sep="")))

