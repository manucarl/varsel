## ---------------------------
##
## Script name: get_batchfiles_all.R
##
## Purpose of script: generates BayesX scripts
## Author: Manuel Carlan
##
## Date Created: 2018-02-10
##
## Email: mcarlan@uni-goettingen.de
##
## ---------------------------

get_batchfiles <- function(datapath, prgpath, resultspath, batchname,repl,seedrepl, scen, n,smHyperpars,linHyperpars, spatHyperpars)
  
{
  ifelse(scen$sparsity == "unsparse", k <- 16, k <- 20)
  k <- 16
  
  prgname <- paste(prgpath , batchname, ".prg", sep="")
  prog <- prgname
  write(NULL,prog)
  write(paste("% usefile ", prgname,sep=""),prog)
  write(paste(""),prog,append=TRUE)
  write(paste("logopen using ", resultspath, ".log", sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("dataset d",sep=""),prog,append=TRUE)
  
  write(paste("d.infile using ", datapath, "/data.raw",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("d.generate c=1 "),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  
  write(paste("map ma \n",
              "ma.infile using /home/mcarlan/VarSel/spatial/westerngermany.bnd", sep =""), prog, append = TRUE)
  
  write(paste(""),prog,append=TRUE)
  write(paste("delimiter=;"),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("mcmcreg m;",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("m.outfile = ",resultspath,"/",batchname,";",sep=""),prog,append=TRUE)
  
  if(scen$family == "zip"){
    store <- k
    k <- 8
    write(paste("m.hregress y", repl," = const + ", paste0("x", 1:k, "(ssvs, gig, v1 = 5, v2 = ", sapply(linHyperpars, "[", "b")[1:k], ", r = ", sapply(linHyperpars, "[", "r")[1:k], ")", collapse = "+ \n")
                
                ,"+ ", paste0("x", 1:k, "(pspline, prior = ssvs, v1 = 5, v2 = ", sapply(smHyperpars, "[", "b")[1:k], ",r = ", sapply(smHyperpars, "[", "r")[1:k], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")
                ,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
                , " weight w, family=zip iterations=12000 burnin=2000 step=10 equationtype=pi using d;",sep=""),prog,append=TRUE)
    write(paste(""),prog,append=TRUE)
    
    k <- 16
    write(paste("m.hregress y", repl," = const + ", paste0("x", 1:k, "(ssvs, gig, v1 = 5, v2 = ", sapply(linHyperpars, "[", "b")[1:k], ", r = ", sapply(linHyperpars, "[", "r")[1:k], ")", collapse = "+ \n")
                ,"+ ", paste0("x", 1:k, "(pspline, prior = ssvs, v1 = 5, v2 = ", sapply(smHyperpars, "[", "b")[1:k], ",r = ", sapply(smHyperpars, "[", "r")[1:k], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")
                ,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
                , " weight w, iterations=12000 burnin=2000 step=10 setseed =",seedrepl," family=zip predict = light equationtype=lambda using d;",sep=""),prog,append=TRUE)
    
    k <- store
  }
  
  if(scen$family == "zinb"){
    store <- k
    k <- 8
    write(paste("m.hregress y", repl," = const + ", paste0("x", 1:k, "(userdefined, designmatdata = X",1:k,", penmatdata = K",1:k,", nocenter, prior=ssvs, v1 = 5, v2 = ", sapply(linHyperpars, "[", "b")[1:k], ", r = ", sapply(linHyperpars, "[", "r")[1:k], ", rankK=1,ssvsupdate=gibbs)", collapse = "+ \n")
                ,"+ ", paste0("x", 1:k, "(pspline, prior = ssvs, v1 = 5, v2 = ", sapply(smHyperpars, "[", "b")[1:k], ",r = ", sapply(smHyperpars, "[", "r")[1:k], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")
                ,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
                , " weight w, family=zinb iterations=12000 burnin=2000 step=10 equationtype=pi using d;",sep=""),prog,append=TRUE)
    write(paste(""),prog,append=TRUE)
    
    write(paste("m.hregress y", repl," = const + ", paste0("x", 1:k, "(userdefined, designmatdata = X",1:k,", penmatdata = K",1:k,", nocenter, prior=ssvs, v1 = 5, v2 = ", sapply(linHyperpars, "[", "b")[1:k], ", r = ", sapply(linHyperpars, "[", "r")[1:k], ", rankK=1,ssvsupdate=gibbs)", collapse = "+ \n")
                ,"+ ", paste0("x", 1:k, "(pspline, prior = ssvs, v1 = 5, v2 = ", sapply(smHyperpars, "[", "b")[1:k], ",r = ", sapply(smHyperpars, "[", "r")[1:k], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")
                ,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
                , " weight w, family=zinb iterations=12000 burnin=2000 step=10 equationtype=delta using d;",sep=""),prog,append=TRUE)
    write(paste(""),prog,append=TRUE)
    k <- 16
    
    write(paste("m.hregress y", repl," = const + ", paste0("x", 1:k, "(userdefined, designmatdata = X",1:k,", penmatdata = K",1:k,", nocenter, prior=ssvs, v1 = 5, v2 = ", sapply(linHyperpars, "[", "b")[1:k], ", r = ", sapply(linHyperpars, "[", "r")[1:k], ", rankK=1,ssvsupdate=gibbs)", collapse = "+ \n")
                ,"+ ", paste0("x", 1:k, "(pspline, prior = ssvs, v1 = 5, v2 = ", sapply(smHyperpars, "[", "b")[1:k], ",r = ", sapply(smHyperpars, "[", "r")[1:k], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")
                ,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
                , " weight w, iterations=12000 burnin=2000 step=10 setseed =",seedrepl,"  predict = light family=zinb equationtype=mu using d;",sep=""),prog,append=TRUE)
    
    k <- store
  }
  
  if(scen$family == "poisson"){
    write(paste("m.hregress y", repl," = const + ", paste0("x", 1:k, "(ssvs, gig, v1 = 5, v2 = ", sapply(linHyperpars, "[", "b")[1:k], ", r = ", sapply(linHyperpars, "[", "r")[1:k], ")", collapse = "+ \n")
                ,"+ ", paste0("x", 1:k, "(pspline, prior = ssvs, v1 = 5, v2 = ", sapply(smHyperpars, "[", "b")[1:k], ",r = ", sapply(smHyperpars, "[", "r")[1:k], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")
                ,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
                , " weight w,iterations=12000 burnin=2000 step=10 setseed =",seedrepl,"  predict = light family=poisson equationtype=lambda using d;",sep=""),prog,append=TRUE)
  }
  
  if(scen$family == "loc-s"){
    store <- k
    k <- 8
    write(paste("m.hregress y", repl," = const + ", paste0("x", 1:k, "(ssvs, gig, v1 = 5, v2 = ", sapply(linHyperpars, "[", "b")[1:k], ", r = ", sapply(linHyperpars, "[", "r")[1:k], ")", collapse = "+ \n")
                ,"+ ", paste0("x", 1:k, "(pspline, prior = ssvs, v1 = 5, v2 = ", sapply(smHyperpars, "[", "b")[1:k], ",r = ", sapply(smHyperpars, "[", "r")[1:k], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")
                ,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
                , " weight w, family=normal iterations=12000 burnin=2000 step=10 equationtype=sigma2 using d;",sep=""),prog,append=TRUE)
    write(paste(""),prog,append=TRUE)
    
    k <- 16
    
    write(paste("m.hregress y", repl," = const + ", paste0("x", 1:k, "(ssvs, gig, v1 = 5, v2 = ", sapply(linHyperpars, "[", "b")[1:k], ", r = ", sapply(linHyperpars, "[", "r")[1:k], ")", collapse = "+ \n")
                ,"+ ", paste0("x", 1:k, "(pspline, prior = ssvs, v1 = 5, v2 = ", sapply(smHyperpars, "[", "b")[1:k], ",r = ", sapply(smHyperpars, "[", "r")[1:k], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")
                ,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
                , " weight w, setseed =",seedrepl,"  predict = light family=normal equationtype=mu using d;",sep=""),prog,append=TRUE)
    
    k <- store
  }
  
  if(scen$family == "normal"){
    write(paste("m.hregress y", repl," = const + ", paste0("x", 1:k, "(ssvs, gig, v1 = 5, v2 = ", sapply(linHyperpars, "[", "b")[1:k], ", r = ", sapply(linHyperpars, "[", "r")[1:k], ")", collapse = "+ \n")
                ,"+ ", paste0("x", 1:k, "(pspline, prior = ssvs, v1 = 5, v2 = ", sapply(smHyperpars, "[", "b")[1:k], ",r = ", sapply(smHyperpars, "[", "r")[1:k], ",ssvsupdate=gibbs, centermethod=nullspace)", collapse = "+ \n")
                ,"+ ", paste0( "region(spatial, map=ma,  prior = ssvs, v1 =5, v2 = ", spatHyperpars$b, ",r = ", spatHyperpars$r, ",ssvsupdate=gibbs)")
                , " weight w, iterations=12000 burnin=2000 step=10 setseed =",seedrepl,"  predict = light family=normal equationtype=mu using d;",sep=""),prog,append=TRUE)
  }
  
  write(paste("m.getsample;",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("m.autocor;"),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("drop m;",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("drop d;",sep=""),prog,append=TRUE)
  write(paste(""),prog,append=TRUE)
  write(paste("logclose;"),prog,append=TRUE)
}
