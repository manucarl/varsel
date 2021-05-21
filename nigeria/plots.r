# nigeria bivariate
library(BayesX)
library(tidyr)

source("nigeria/plot_legend.r")
source("nigeria/plot_sizes.r")

source("nigeria/basisZ_mbmi.r")
source("nigeria/basisZ_mage.r")
source("nigeria/basisZ_cage.r")

# read results from BayesX
source("nigeria/read_ssvs.r")
source("nigeria/read_nossvs.r")

require(ggplot2)
data <- read.table("nigeria/data/nigeria4.raw", header = TRUE)

par(mar=c(4,4,2,1)+0.1, oma = c(0,0,0,0),ps=10)

mbmi <- unique(data$mbmi)
mbmi <- mbmi[order(mbmi)]
mage <- unique(data$mage)
mage <- mage[order(mage)]
cage <- unique(data$cage)
cage <- cage[order(cage)]


mbmi2 <- unique(data$mbmi2)
mbmi2 <- mbmi2[order(mbmi2)]
mage2 <- unique(data$mage2)
mage2 <- mage2[order(mage2)]
cage2 <- unique(data$cage2)
cage2 <- cage2[order(cage2)]
# splines
cols2 <- c("grey", "darkgrey", "black", "darkgrey", "grey")
cols1 <- c("firebrick1", "firebrick2", "firebrick3", "firebrick2", "firebrick1")

pos <- c(5, 6, 3, 8, 9)

#pdf("nigeria_nonlin.pdf", width = height_90, height = width_90)


# multiply
lin.cage.rho <- wasting.rho.lin[wasting.rho.lin$varname=="cage2",]$pmean* wasting.rho.cage$cage2
lin.mage.rho <- wasting.rho.lin[wasting.rho.lin$varname=="mage2",]$pmean*wasting.rho.mage$mage2
lin.mbmi.rho <- wasting.rho.lin[wasting.rho.lin$varname=="mbmi2",]$pmean*wasting.rho.mbmi$mbmi2

lin.cage.s.sigma <- stunting.sigma.lin[stunting.sigma.lin$varname=="cage2",]$pmean*stunting.sigma.cage$cage
lin.mage.s.sigma <- stunting.sigma.lin[stunting.sigma.lin$varname=="mage2",]$pmean*stunting.sigma.mage$mage
lin.mbmi.s.sigma <- stunting.sigma.lin[stunting.sigma.lin$varname=="mbmi2",]$pmean*stunting.sigma.mbmi$mbmi

lin.cage.w.sigma <- wasting.sigma.lin[wasting.sigma.lin$varname=="cage2",]$pmean * wasting.sigma.cage$cage
lin.mage.w.sigma <- wasting.sigma.lin[wasting.sigma.lin$varname=="mage2",]$pmean * wasting.sigma.mage$mage
lin.mbmi.w.sigma <- wasting.sigma.lin[wasting.sigma.lin$varname=="mbmi2",]$pmean * wasting.sigma.mbmi$mbmi

lin.cage.w.mu <- wasting.mu.lin[wasting.mu.lin$varname=="cage2",]$pmean * wasting.mu.cage$cage
lin.mage.w.mu <- wasting.mu.lin[wasting.mu.lin$varname=="mage2",]$pmean * wasting.mu.mage$mage
lin.mbmi.w.mu <- wasting.mu.lin[wasting.mu.lin$varname=="mbmi2",]$pmean * wasting.mu.mbmi$mbmi

lin.cage.s.mu <- stunting.mu.lin[stunting.mu.lin$varname=="cage2",]$pmean * stunting.mu.cage$cage
lin.mage.s.mu <- stunting.mu.lin[stunting.mu.lin$varname=="mage2",]$pmean * stunting.mu.mage$mage
lin.mbmi.s.mu <- stunting.mu.lin[stunting.mu.lin$varname=="mbmi2",]$pmean * stunting.mu.mbmi$mbmi

wasting.rho.cage.dat <- cbind(x=cage,gather(cbind((wasting.rho.cage[,pos[1:5]]+lin.cage.rho))), source="NBSS prior", var="cage", param="rho - wasting")
wasting.rho.mage.dat <- cbind(x=mage,gather(cbind((wasting.rho.mage[,pos[1:5]]+lin.mage.rho))), source="NBSS prior", var="mage", param="rho - wasting")
wasting.rho.mbmi.dat <- cbind(x=mbmi,gather(cbind((wasting.rho.mbmi[,pos[1:5]]+lin.mbmi.rho))), source="NBSS prior", var="mbmi", param="rho - wasting")

wasting.rho.cage.full.dat <- cbind(x=cage, gather(cbind(wasting.rho.cage.full[,pos[1:5]])), source="Full Model", var="cage", param="rho - wasting")
wasting.rho.mage.full.dat <- cbind(x=mage, gather(cbind(wasting.rho.mage.full[,pos[1:5]])), source="Full Model", var="mage", param="rho - wasting")
wasting.rho.mbmi.full.dat <- cbind(x=mbmi, gather(cbind(wasting.rho.mbmi.full[,pos[1:5]])), source="Full Model", var="mbmi", param="rho - wasting")

stunting.sigma.cage.dat <- cbind(x=cage,gather(cbind((stunting.sigma.cage[,pos[1:5]]+lin.cage.s.sigma))), source="NBSS prior", var="cage",param="sigma - stunting")
stunting.sigma.mage.dat <- cbind(x=mage,gather(cbind((stunting.sigma.mage[,pos[1:5]]+lin.mage.s.sigma))), source="NBSS prior", var="mage",param="sigma - stunting")
stunting.sigma.mbmi.dat <- cbind(x=mbmi,gather(cbind((stunting.sigma.mbmi[,pos[1:5]]+lin.mbmi.s.sigma))), source="NBSS prior", var="mbmi",param="sigma - stunting")

stunting.sigma.cage.full.dat <- cbind(x=cage, gather(cbind(stunting.sigma.cage.full[,pos[1:5]])), source="Full Model", var="cage", param="sigma - stunting")
stunting.sigma.mage.full.dat <- cbind(x=mage, gather(cbind(stunting.sigma.mage.full[,pos[1:5]])), source="Full Model", var="mage", param="sigma - stunting")
stunting.sigma.mbmi.full.dat <- cbind(x=mbmi, gather(cbind(stunting.sigma.mbmi.full[,pos[1:5]])), source="Full Model", var="mbmi", param="sigma - stunting")

wasting.sigma.cage.dat <- cbind(x=cage,gather(cbind((wasting.sigma.cage+lin.cage.w.sigma)[,pos[1:5]])), source="NBSS prior", var="cage",param="sigma - wasting")
wasting.sigma.mage.dat <- cbind(x=mage,gather(cbind((wasting.sigma.mage+lin.mage.w.sigma)[,pos[1:5]])), source="NBSS prior", var="mage",param="sigma - wasting")
wasting.sigma.mbmi.dat <- cbind(x=mbmi,gather(cbind((wasting.sigma.mbmi+lin.mbmi.w.sigma)[,pos[1:5]])), source="NBSS prior", var="mbmi",param="sigma - wasting")

wasting.sigma.cage.full.dat <- cbind(x=cage, gather(cbind(wasting.sigma.cage.full[,pos[1:5]])), source="Full Model", var="cage", param="sigma - wasting")
wasting.sigma.mage.full.dat <- cbind(x=mage, gather(cbind(wasting.sigma.mage.full[,pos[1:5]])), source="Full Model", var="mage", param="sigma - wasting")
wasting.sigma.mbmi.full.dat <- cbind(x=mbmi, gather(cbind(wasting.sigma.mbmi.full[,pos[1:5]])), source="Full Model", var="mbmi", param="sigma - wasting")

wasting.mu.cage.dat <- cbind(x=cage,gather(cbind((wasting.mu.cage+lin.cage.w.mu)[,pos[1:5]])), source="NBSS prior", var="cage",param="mu - wasting")
wasting.mu.mage.dat <- cbind(x=mage,gather(cbind((wasting.mu.mage+lin.mage.w.mu)[,pos[1:5]])), source="NBSS prior", var="mage",param="mu - wasting")
wasting.mu.mbmi.dat <- cbind(x=mbmi,gather(cbind((wasting.mu.mbmi+lin.mbmi.w.mu)[,pos[1:5]])), source="NBSS prior", var="mbmi",param="mu - wasting")

wasting.mu.cage.full.dat <- cbind(x=cage, gather(cbind(wasting.mu.cage.full[,pos[1:5]])), source="Full Model", var="cage", param="mu - wasting")
wasting.mu.mage.full.dat <- cbind(x=mage, gather(cbind(wasting.mu.mage.full[,pos[1:5]])), source="Full Model", var="mage", param="mu - wasting")
wasting.mu.mbmi.full.dat <- cbind(x=mbmi, gather(cbind(wasting.mu.mbmi.full[,pos[1:5]])), source="Full Model", var="mbmi", param="mu - wasting")

stunting.mu.cage.dat <- cbind(x=cage,gather(cbind((stunting.mu.cage+lin.cage.s.mu)[,pos[1:5]])), source="NBSS prior", var="cage",param="mu - stunting")
stunting.mu.mage.dat <- cbind(x=mage,gather(cbind((stunting.mu.mage+lin.mage.s.mu)[,pos[1:5]])), source="NBSS prior", var="mage",param="mu - stunting")
stunting.mu.mbmi.dat <- cbind(x=mbmi,gather(cbind((stunting.mu.mbmi+lin.mbmi.s.mu)[,pos[1:5]])), source="NBSS prior", var="mbmi",param="mu - stunting")


stunting.mu.cage.full.dat <- cbind(x=cage, gather(cbind(stunting.mu.cage.full[,pos[1:5]])), source="Full Model", var="cage", param="mu - stunting")
stunting.mu.mage.full.dat <- cbind(x=mage, gather(cbind(stunting.mu.mage.full[,pos[1:5]])), source="Full Model", var="mage", param="mu - stunting")
stunting.mu.mbmi.full.dat <- cbind(x=mbmi, gather(cbind(stunting.mu.mbmi.full[,pos[1:5]])), source="Full Model", var="mbmi", param="mu - stunting")


###### Construction of nonlinear effect


Z.mbmi2 <- basisZ_mbmi(mbmi2)
Z.mage2 <- basisZ_mage(mage2)
Z.cage2 <- basisZ_cage(cage2)
params <- c("rho", "sigma", "mu")
vars <- c("wasting2", "stunting2")
kovars <- c("mbmi2", "cage2", "mage2")
effs <- expand.grid(params, vars, kovars)
effs <- effs[!(effs$Var1 == "rho" & effs$Var2 == "stunting2"),]

# setwd("C:/Studies/HypChoice/Nigeria/res/bivn/")
i <-1

ggEffFun <- function(i){
  ### construct nonlinear effect
  
  param <- as.character(effs[i,1])
  var <- as.character(effs[i,2])
  kovar <- as.character(effs[i,3])
  
  
  
  
  lin.sample.var.param <- read.table(paste0("nigeria/results/bivn/bivn_MAIN_",param,"_REGRESSION_", var, "_LinearEffects_ssvs_sample.raw"), header=T)
  
  colnames(lin.sample.var.param) <- c("intnr","mbmi2", "mage2", "cage2", "csex", "electricity", "cbirthorder",
                                      "edupartner", "munemployed", "mresidence", "car", "motorcycle",
                                      "radio", "television", "ctwin", "refrigerator", "bicycle")
  
  samp.dat <- read.table(paste0("nigeria/results/bivn/bivn_MAIN_",param,"_REGRESSION_", var, "_nonlinear_pspline_effect_of_", kovar,"_sample.raw"), header=T)
  #param.dat <- read.table("bivn_MAIN_",param, "_REGRESSION_", var, "_nonlinear_pspline_effect_of_", kovar, "_param.res", header=T)
  #res.dat <- read.table("bivn_MAIN_rho_REGRESSION_wasting2_nonlinear_pspline_effect_of_mbmi2.res", header=T)
  
  # need: 1000 effect samples
  
  # 1000 samples of 60 obs
  # mbmi2 <- unique(data$mbmi2)
  # mbmi2 <- mbmi2[order(mbmi2)]
  # mage2 <- unique(data$mage2)
  # mage2 <- mage2[order(mage2)]
  # cage2 <- unique(data$cage2)
  # cage2<- cage2[order(cage2)]
  
  kv <- unique(data[,kovar])
  kv <- kv[order(kv)]
  # multiply beta coefficient of each sample with covariate to get 1000 samples of linear effects
  lin.samp <- lapply(lin.sample.var.param[,kovar], function(x) x* kv)
  
  # 1000 samples in columns
  lin.samp <- do.call(cbind, lin.samp)
  
  # 1000 samples of nonlinear effect in columns
  sm.samp <- get(paste0("Z.",kovar)) %*% t(samp.dat[,-1])
  
  
  eff <-scale((lin.samp +sm.samp), scale=F)
  
  #mbmi.res.c <-t(scale(lin.samp, scale=F) + scale(sm.samp, scale=F))
  
  eff.dat <- data.frame(pmean=apply(t(eff), 2, mean),
                        pqu2p5 =apply(t(eff), 2, function(x) quantile(x, prob=c(0.025))),
                        pqu97p5 =apply(t(eff), 2, function(x) quantile(x, prob=c(0.975))))
  
  kv <- get(substr(kovar, 1, nchar(kovar)-1))
  
  eff.dat <- cbind(x=kv, gather(eff.dat), source="NPBSS", kovar=kovar, param_var=paste0(param, " - ", var))
  
  
  
  eff.dat.full <- get(paste0(gsub('[0-9]+', '', var),".",param, ".", gsub('[0-9]+', '', kovar),".full"))
  pmean.full <- scale(eff.dat.full$pmean, scale=F)
  pqu2p5.full <- eff.dat.full$pqu2p5 -   attr(pmean.full, "scaled:center")
  pqu97p5.full <- eff.dat.full$pqu97p5 -  attr(pmean.full, "scaled:center")
  
  eff.dat.full <- cbind(x = kv, gather(data.frame(pmean= pmean.full, pqu2p5= pqu2p5.full, pqu97p5=pqu97p5.full)), source="Full Model", kovar=kovar, param_var=paste0(param, " - ", var))
  
  
  dat <- rbind(eff.dat, eff.dat.full)
  
  return(dat)
}
gg <- lapply(1:nrow(effs), ggEffFun)

gg.data <- do.call(rbind, gg)
gg.data$param_var <-substr(gg.data$param_var, 1, nchar(as.character(gg.data$param_var))-1)
gg.data$kovar <- substr(gg.data$kovar, 1, nchar(as.character(gg.data$kovar))-1)

# pdf("nigeria_bivn_nonlin.pdf" , width = 2*480, height = 2*480)
ggplot(gg.data, aes(x=x, y=value)) + geom_line(aes(linetype=factor(key),colour=as.factor(source), alpha=as.factor(source))) + 
  facet_grid(factor(param_var, , levels=c("rho - wasting", "sigma - stunting", "sigma - wasting", "mu - stunting", "mu - wasting")) ~ kovar ,scales="free", labeller=label_parsed)+
  scale_colour_manual(values=c("red", "dodgerblue3")) + scale_alpha_manual(values=c(1,0.8)) + 
  scale_linetype_manual(values=c("solid", "dotted", "dotted")) +
  guides(colour=guide_legend(title="Model"), alpha=FALSE, linetype=FALSE) + xlab("") + ylab("")

# ggsave("nigeria/niger_bivn_nonlin.png",width = 7, height = 7)

cols <- c("firebrick3","firebrick1", "firebrick2" , "firebrick2", "firebrick1")


# BayesX retort plots
min = min(wasting.sigma.cage[,c(5,9)])
max = max(wasting.sigma.cage[,c(5,9)])
plot(cage, rep(0, nrow(wasting.sigma.cage)), ylim = c(min, max), main = expression(paste(sigma, " - wasting", sep = "")), type = "l", xlab = "cage", ylab = "")
for(i in 1:5){
  lines(cage, wasting.sigma.cage[,pos[i]], col = cols[i], lty = 2)
}

min = min(wasting.sigma.mage[,c(5,9)])
max = max(wasting.sigma.mage[,c(5,9)])
plot(mage, rep(0, nrow(wasting.sigma.mage)), ylim = c(min, max), main = expression(paste(sigma, " - wasting", sep = "")), type = "l", xlab = "mage", ylab = "")
for(i in 1:5){
  lines(mage, wasting.sigma.mage[,pos[i]], col = cols[i], lty = 2)
}

min = min(wasting.sigma.mbmi[,c(5,9)])
max = max(wasting.sigma.mbmi[,c(5,9)])
plot(mbmi, rep(0, nrow(wasting.sigma.mbmi)), ylim = c(min, max), main = expression(paste(sigma, " - wasting", sep = "")), type = "l", xlab = "mbmi", ylab = "")
for(i in 1:5){
  lines(mbmi, wasting.sigma.mbmi[,pos[i]], col = cols[i], lty = 2)
}


min = min(stunting.mu.cage[,c(5,9)])
max = max(stunting.mu.cage[,c(5,9)])
plot(cage, rep(0, nrow(stunting.mu.cage)), ylim = c(min, max), main = expression(paste(mu, " - stunting", sep = "")), type = "l", xlab = "cage", ylab = "")
for(i in 1:5){
  lines(cage, stunting.mu.cage[,pos[i]], col = cols[i], lty = 2)
}

min = min(stunting.mu.mage[,c(5,9)])
max = max(stunting.mu.mage[,c(5,9)])
plot(mage, rep(0, nrow(stunting.mu.mage)), ylim = c(min, max), main = expression(paste(mu, " - stunting", sep = "")), type = "l", xlab = "mage", ylab = "")
for(i in 1:5){
  lines(mage, stunting.mu.mage[,pos[i]], col = cols[i], lty = 2)
}

min = min(stunting.mu.mbmi[,c(5,9)])
max = max(stunting.mu.mbmi[,c(5,9)])
plot(mbmi, rep(0, nrow(stunting.mu.mbmi)), ylim = c(min, max), main = expression(paste(mu, " - stunting", sep = "")), type = "l", xlab = "mbmi", ylab = "")
for(i in 1:5){
  lines(mbmi, stunting.mu.mbmi[,pos[i]], col = cols[i], lty = 2)
}

min = min(wasting.mu.cage[,c(5,9)])
max = max(wasting.mu.cage[,c(5,9)])
plot(cage, rep(0, nrow(wasting.mu.cage)), ylim = c(min, max), main = expression(paste(mu, " - stunting", sep = "")), type = "l", xlab = "cage", ylab = "")
for(i in 1:5){
  lines(cage, wasting.mu.cage[,pos[i]], col = cols[i], lty = 2)
}

min = min(wasting.mu.mage[,c(5,9)])
max = max(wasting.mu.mage[,c(5,9)])
plot(mage, rep(0, nrow(wasting.mu.mage)), ylim = c(min, max), main = expression(paste(mu, " - stunting", sep = "")), type = "l", xlab = "mage", ylab = "")
for(i in 1:5){
  lines(mage, wasting.mu.mage[,pos[i]], col = cols[i], lty = 2)
}

min = min(wasting.mu.mbmi[,c(5,9)])
max = max(wasting.mu.mbmi[,c(5,9)])
plot(mbmi, rep(0, nrow(wasting.mu.mbmi)), ylim = c(min, max), main = expression(paste(mu, " - stunting", sep = "")), type = "l", xlab = "mbmi", ylab = "")
for(i in 1:5){
  lines(mbmi, wasting.mu.mbmi[,pos[i]], col = cols[i], lty = 2)
}
dev.off()


# linear effects
data.lin <- rbind(wasting.rho.lin,
                  stunting.sigma.lin,
                  wasting.sigma.lin,
                  stunting.mu.lin,
                  wasting.mu.lin
)

data.lin$varname
data.lin$parameter <- rep(c(1,2,2,3,3), each = 16)#as.character(rep(c("1", "1", "2", "2", "3", "4", "4", "5"), each = 18))

data.lin$choltype <- rep(c(4,5,4,5,4), each = 16)#(rep(c("6", "7", "6", "7", "6", "6", "7", "6"), each = 18))

data.lin$Variable <- data.lin$varname
data.lin$Mean <- data.lin$pmean


labels <- list("1" = expression(rho),
               "2" = expression(sigma),
               "3" = expression(mu),
               "4" = expression(wasting),
               "5" = expression(stunting))

new_label <- function(variable,value){
  return(labels[value])
}

# pdf("nigeria_bivn_lin.pdf", width = width, height = width_90)
ggplot(data.lin, aes(Variable, Mean) )  +
  geom_point()  + 
  geom_errorbar(aes(ymax = pqu97p5, ymin = pqu2p5)) + 
  coord_flip() + 
  theme_minimal(base_size = 8) + 
  facet_grid(parameter ~ choltype, labeller = new_label)
dev.off()

data.lin.nossvs <-rbind(wasting.rho.lin.full,
                        stunting.sigma.lin.full,
                        wasting.sigma.lin.full,
                        stunting.mu.lin.full,
                        wasting.mu.lin.full
)
data.lin.nossvs <- data.lin.nossvs[data.lin.nossvs$varname != "const",]
data.lin.nossvs$parameter <- rep(c(1,2,2,3,3), each = 13)#as.character(rep(c("1", "1", "2", "2", "3", "4", "4", "5"), each = 18))

data.lin.nossvs$choltype <- rep(c(4,5,4,5,4), each = 13)#(rep(c("6", "7", "6", "7", "6", "6", "7", "6"), each = 18))

data.lin.nossvs$Variable <- data.lin.nossvs$varname
data.lin.nossvs$Mean <- data.lin.nossvs$pmean

data.lin <- data.frame(data.lin, source="ssvs")
data.lin.nossvs <- data.frame(data.lin.nossvs, source="nossvs")
data <- rbind(data.lin, data.lin.nossvs)
data$alpha <- ifelse(data$source == "ssvs",  0.5, 0.45)



# png("nigeria_bivn_lin.png" , width = 2*480, height = 2*480)
# ggsave("niger_bivn_lin.pdf",width = 7, height = 7)


ggplot(data, aes(x =Variable,
                 y=Mean, colour=as.factor(source))) +
  geom_point(size=1)+
  geom_errorbar(aes(ymax = pqu97p5, ymin = pqu2p5), lwd=0.05)+
  coord_flip()+
  theme_minimal(base_size = 8)+
  facet_grid(parameter ~ choltype, labeller = new_label)+
  #   scale_alpha_manual(values = c("ssvs"=1, "nossvs"=0.2), guide = 'none') +
  scale_colour_manual(values = c("ssvs"="red", "nossvs"="dodgerblue3"), labels=c("NBSS prior", "Full model"),guide = 'none')+
  ylab("Posterior Mean") + xlab("Variable")+
  guides(colour=guide_legend(title="Model"))

# ggsave("nigeria/niger_bivn_lin.png",width = 7, height = 7)


########### spatial plot
indiaraw <- read.dta("nigeria/data/NGKR6AFL.DTA")

states <- levels(indiaraw$v023)

states_str <- as.character(states)
in_it <- rep(FALSE, 73)
for(i in 1:73){
  in_it[i] <- length(grep("Urban", states_str[i])) > 0
}

states <- as.factor(states_str[in_it])

map <- shp2bnd(shpname = "nigeria/data/sdr_subnational_boundaries_2015-08-10-2/shps2/sdr_subnational_boundaries2",
               regionnames = states)


ord <- wasting.rho.subregion$subregion
# pdf("apl_nigeria_map_rho.pdf", width = width, height = 5)
# pdf("apl_nigeria_map_rho.pdf")
# postscript(file = paste0("apl_nigeria_map_rho.eps"), horizontal = FALSE)

rho1 <- wasting.rho.subregion$pmean[ord]

limmax <- max(max(rho1))
limmin <- min(min(rho1))
#limmax <- max(max(xi1), max(xi2))
#limmin <- min(min(xi1), min(xi2))
limmax <- 0.1 * ceiling(10*limmax)
limmin <- 0.1 * floor(10*limmin)
limmin <- sign(limmin) * max(limmax, -limmin)
limmax <- sign(limmax) * max(limmax, -limmin)
par(mar=c(4,4,2,1)+0.1, oma = c(0,0,0,0))
data <- data.frame(intnr = seq(1, length(states)), states = as.character(states), x = rho1)

layout(matrix(c(1,2),nrow = 2, byrow = TRUE), widths = c(1), heights = c(1,0.2))
drawmap(data = data, map = map, drawnames = FALSE, plotvar = "x", swapcolors = TRUE, limits = c(limmin, limmax), hcl.par = list(h = c(250, 0), c = 80, l = c(50, 95), power = 1.2), legend = FALSE, main = expression(paste("wasting")))

par(mar=c(0,0,0,0))
legend_map(c(limmin,limmax), window.scale=4)
par(mar=c(4,4,2,1)+0.1)

dev.off()

# pdf("nigeria/nigeria_map_sigma.pdf", width = width, height = 3.5)
# postscript(file = paste0("apl_nigeria_map_sigma.eps"), horizontal = FALSE)


sigma1 <- wasting.sigma.subregion$pmean[ord]
sigma2 <- stunting.sigma.subregion$pmean[ord]

limmax <- max(max(sigma1), max(sigma2))
limmin <- min(min(sigma1), min(sigma2))
limmax <- 0.1 * ceiling(10*limmax)
limmin <- 0.1 * floor(10*limmin)
limmin <- sign(limmin) * max(limmax, -limmin)
limmax <- sign(limmax) * max(limmax, -limmin)
data <- data.frame(intnr = seq(1, length(states)), states = as.character(states), x = sigma1)
layout(matrix(c(1,2,3,3),nrow = 2, byrow = TRUE), widths = c(1,1), heights = c(1,0.2))
drawmap(data = data, map = map, drawnames = FALSE, plotvar = "x", swapcolors = TRUE, limits = c(limmin, limmax), hcl.par = list(h = c(250, 0), c = 80, l = c(50, 95), power = 1.2), legend = FALSE, main = expression(paste("wasting")))
data <- data.frame(intnr = seq(1, length(states)), states = as.character(states), x = sigma2)
drawmap(data = data, map = map, drawnames = FALSE, plotvar = "x", swapcolors = TRUE, limits = c(limmin, limmax), hcl.par = list(h = c(250, 0), c = 80, l = c(50, 95), power = 1.2), legend = FALSE, main = expression(paste("stunting")))

par(mar=c(0,0,0,0))
legend_map(c(limmin,limmax), window.scale=4)
par(mar=c(4,4,2,1)+0.1)

dev.off()



# pdf("nigeria/nigeria_map_mu.pdf", width = width, height = 3.5)
# postscript(file = paste0("apl_nigeria_map_mu.eps"), horizontal = FALSE)

mu1 <- wasting.mu.subregion$pmean[ord]
mu2 <- stunting.mu.subregion$pmean[ord]

limmax <- max(max(mu1), max(mu2))
limmin <- min(min(mu1), min(mu2))
limmax <- 0.1 * ceiling(10*limmax)
limmin <- 0.1 * floor(10*limmin)
limmin <- sign(limmin) * max(limmax, -limmin)
limmax <- sign(limmax) * max(limmax, -limmin)
data <- data.frame(intnr = seq(1, length(states)), states = as.character(states), x = mu1)
layout(matrix(c(1,2,3,3),nrow = 2, byrow = TRUE), widths = c(1,1), heights = c(1,0.2))
drawmap(data = data, map = map, drawnames = FALSE, plotvar = "x", swapcolors = TRUE, limits = c(limmin, limmax), hcl.par = list(h = c(250, 0), c = 80, l = c(50, 95), power = 1.2), legend = FALSE, main = expression(paste("wasting")))
data <- data.frame(intnr = seq(1, length(states)), states = as.character(states), x = mu2)
drawmap(data = data, map = map, drawnames = FALSE, plotvar = "x", swapcolors = TRUE, limits = c(limmin, limmax), hcl.par = list(h = c(250, 0), c = 80, l = c(50, 95), power = 1.2), legend = FALSE, main = expression(paste("stunting")))

par(mar=c(0,0,0,0))
legend_map(c(limmin,limmax), window.scale=4)
par(mar=c(4,4,2,1)+0.1)

dev.off()
