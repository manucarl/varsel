## ---------------------------
##
## Script name: plot.R
##
## Purpose of script: generates plots for housing application in the paper
## Author: Manuel Carlan
##
## Date Created: 2018-05-10
##
## Email: mcarlan@uni-goettingen.de
##
## ---------------------------
## ## https://projecteuclid.org/journals/bayesian-analysis/volume-16/issue-2/Bayesian-Effect-Selection-in-Structured-Additive-Distributional-Regression-Models/10.1214/20-BA1214.full
 
library(BayesX)
library(tidyverse)
library("gridExtra")
library(grid)
source("immo/plot_legend.r")
source("immo/plot_sizes.r")
source("immo/read.r")
# if f, produce list of plots in the end without storing them as ps
store_plots <- T

dat <- read.table("immo/data/subsample1a_aufb.raw", header=T)

dat2 <- read.table("immo/data/kreis1_neu.txt", header=T)

baujahr1_unsc <- unique(dat$baujahr)
baujahr1_unsc <- baujahr1_unsc[order(baujahr1_unsc)]

grstfl1_unsc <- unique(dat$grstfl)
grstfl1_unsc <- grstfl1_unsc[order(grstfl1_unsc)]

rating1_unsc <- unique(dat$rating)
rating1_unsc <- rating1_unsc[order(rating1_unsc)]

wfl1_unsc <- unique(dat$wfl)
wfl1_unsc <- wfl1_unsc[order(wfl1_unsc)]

require(ggplot2)
par(mar=c(4,4,2,1)+0.1, oma = c(0,0,0,0),ps=10)

baujahr1 <- unique(y1.mu.baujahr$baujahr_s)
baujahr1 <- baujahr1[order(baujahr1)]
grstfl1 <- unique(y1.mu.grstfl$grstfl_s)
grstfl1 <- grstfl1[order(grstfl1)]
rating1 <- unique(y1.mu.rating$rating_s)
rating1 <- rating1[order(rating1)]
wfl1 <- unique(y1.mu.wfl$wfl_s)
wfl1 <- wfl1[order(wfl1)]



baujahr2 <- unique(y2.mu.baujahr$baujahr_s)
baujahr2 <- baujahr2[order(baujahr2)]
rating2 <- unique(y2.mu.rating$rating_s)
rating2 <- rating2[order(rating2)]

baujahr1 <- unique(dat$baujahr_s)
baujahr1 <- baujahr1[order(baujahr1)]
grstfl1 <- unique(dat$grstfl_s)
grstfl1 <- grstfl1[order(grstfl1)]
rating1 <- unique(dat$rating_s)
rating1 <- rating1[order(rating1)]
wfl1 <- unique(dat$wfl_s)
wfl1 <- wfl1[order(wfl1)]

baujahr2 <- unique(dat2$baujahr_s)
baujahr2 <- baujahr2[order(baujahr2)]

rating2 <- unique(dat2$rating_s)
rating2 <- rating2[order(rating2)]

baujahr2_unsc <- unique(as.numeric(by(dat$baujahr, dat$kgs05a, mean)))
baujahr2_unsc <- baujahr2_unsc[order(baujahr2_unsc)]
rating2_unsc <- unique(as.numeric(by(dat$rating, dat$kgs05a, mean)))
rating2_unsc <- rating2_unsc[order(rating2_unsc)]

rating.scale <- scale(rating2_unsc)
rating2_unsc2 <- (rating2 +attributes(rating.scale)[[2]])*attributes(rating.scale)[[3]]

# splines
cols2 <- c("grey", "darkgrey", "black", "darkgrey", "grey")
cols1 <- c("firebrick1", "firebrick2", "firebrick3", "firebrick2", "firebrick1")
pos <- c(5, 6, 3, 8, 9)

# nonlinear effect data
y1.mu.baujahr <- cbind(x=baujahr1_unsc, gather(cbind((y1.mu.baujahr[,pos[c(1,3,5)]]))), source="NBPSS", var="yoc", param="level1: mu")
y1.mu.grstfl <- cbind(x=grstfl1_unsc, gather(cbind((y1.mu.grstfl[,pos[c(1,3,5)]]))), source="NBPSS", var="areapl", param="level1: mu")
y1.mu.rating <- cbind(x=rating1_unsc, gather(cbind((y1.mu.rating[,pos[c(1,3,5)]]))), source="NBPSS", var="rating", param="level1: mu")
y1.mu.wfl <- cbind(x=wfl1_unsc, gather(cbind((y1.mu.wfl[,pos[c(1,3,5)]]))), source="NBPSS", var="arealiv", param="level1: mu")

y1.mu.baujahr.full <- cbind(x=baujahr1_unsc, gather(cbind((y1.mu.baujahr.full[,pos[c(1,3,5)]]))), source="Full Model", var="yoc", param="level1: mu")
y1.mu.grstfl.full <- cbind(x=grstfl1_unsc, gather(cbind((y1.mu.grstfl.full[,pos[c(1,3,5)]]))), source="Full Model", var="areapl", param="level1: mu")
y1.mu.rating.full <- cbind(x=rating1_unsc, gather(cbind((y1.mu.rating.full[,pos[c(1,3,5)]]))), source="Full Model", var="rating", param="level1: mu")
y1.mu.wfl.full <- cbind(x=wfl1_unsc, gather(cbind((y1.mu.wfl.full[,pos[c(1,3,5)]]))), source="Full Model", var="arealiv", param="level1: mu")

y2.mu.baujahr <- cbind(x=baujahr2_unsc, gather(cbind((y2.mu.baujahr[,pos[c(1,3,5)]]))), source="NBPSS", var="bar(yoc)", param="level2: mu")
y2.mu.rating <- cbind(x=rating2_unsc2, gather(cbind((y2.mu.rating[,pos[c(1,3,5)]]))), source="NBPSS", var="bar(rating)", param="level2: mu")

y2.mu.baujahr.full <- cbind(x=baujahr2_unsc, gather(cbind((y2.mu.baujahr.full[,pos[c(1,3,5)]]))), source="Full Model", var="bar(yoc)", param="level2: mu")
y2.mu.rating.full <- cbind(x=rating2_unsc2, gather(cbind((y2.mu.rating.full[,pos[c(1,3,5)]]))), source="Full Model", var="bar(rating)", param="level2: mu")

y1.sigma2.baujahr <- cbind(x=baujahr1_unsc, gather(cbind((y1.sigma2.baujahr[,pos[c(1,3,5)]]))), source="NBPSS", var="yoc", param="level1: sigma^2")
y1.sigma2.grstfl <- cbind(x=grstfl1_unsc, gather(cbind((y1.sigma2.grstfl[,pos[c(1,3,5)]]))), source="NBPSS", var="areapl", param="level1: sigma^2")
y1.sigma2.rating <- cbind(x=rating1_unsc, gather(cbind((y1.sigma2.rating[,pos[c(1,3,5)]]))), source="NBPSS", var="rating", param="level1: sigma^2")
y1.sigma2.wfl <- cbind(x=wfl1_unsc, gather(cbind((y1.sigma2.wfl[,pos[c(1,3,5)]]))), source="NBPSS", var="arealiv", param="level1: sigma^2")


y1.sigma2.baujahr.full <- cbind(x=baujahr1_unsc, gather(cbind((y1.sigma2.baujahr.full[,pos[c(1,3,5)]]))), source="Full Model", var="yoc", param="level1: sigma^2")
y1.sigma2.grstfl.full <- cbind(x=grstfl1_unsc, gather(cbind((y1.sigma2.grstfl.full[,pos[c(1,3,5)]]))), source="Full Model", var="areapl", param="level1: sigma^2")
y1.sigma2.rating.full <- cbind(x=rating1_unsc, gather(cbind((y1.sigma2.rating.full[,pos[c(1,3,5)]]))), source="Full Model", var="rating", param="level1: sigma^2")
y1.sigma2.wfl.full <- cbind(x=wfl1_unsc, gather(cbind((y1.sigma2.wfl.full[,pos[c(1,3,5)]]))), source="Full Model", var="arealiv", param="level1: sigma^2")

y2.sigma2.baujahr <- cbind(x=baujahr2_unsc, gather(cbind((y2.sigma2.baujahr[,pos[c(1,3,5)]]))), source="NBPSS", var="bar(yoc)", param="level2: sigma^2")
y2.sigma2.rating <- cbind(x=rating2_unsc2, gather(cbind((y2.sigma2.rating[,pos[c(1,3,5)]]))), source="NBPSS", var="bar(rating)", param="level2: sigma^2")

y2.sigma2.baujahr.full <- cbind(x=baujahr2_unsc, gather(cbind((y2.sigma2.baujahr.full[,pos[c(1,3,5)]]))), source="Full Model", var="bar(yoc)", param="level2: sigma^2")
y2.sigma2.rating.full <- cbind(x=rating2_unsc2, gather(cbind((y2.sigma2.rating.full[,pos[c(1,3,5)]]))), source="Full Model", var="bar(rating)", param="level2: sigma^2")


gg.data1 <- rbind(y1.mu.baujahr, y1.mu.rating,y1.mu.grstfl, y1.mu.wfl,
                 y1.mu.baujahr.full, y1.mu.rating.full ,y1.mu.grstfl.full, y1.mu.wfl.full,
                 y1.sigma2.baujahr, y1.sigma2.rating,y1.sigma2.grstfl,  y1.sigma2.wfl,
                 y1.sigma2.baujahr.full, y1.sigma2.rating.full ,y1.sigma2.grstfl.full ,  y1.sigma2.wfl.full)
                 
gg.data2 <- rbind(y2.mu.baujahr, y2.mu.rating,
                 y2.mu.baujahr.full, y2.mu.rating.full,
                 y2.sigma2.baujahr, y2.sigma2.rating,
                 y2.sigma2.baujahr.full, y2.sigma2.rating.full)



if(store_plots==T) postscript(file = "./immo/immo2_nonlin1.eps",width=11, height=7,paper="special",horizontal = T)

immo_nonlin1 <- ggplot(gg.data1, aes(x=x, y=value)) + geom_line(aes(linetype=factor(key),colour=as.factor(source), size=source), lineend = "round") + 
  facet_wrap(param ~ var ,scales="free", ncol=4,labeller=label_parsed)+
  scale_colour_manual(values=c("red", "dodgerblue3")) + scale_alpha_manual(values=c(1,0.8)) + 
  scale_linetype_manual(values=c("solid", "dotted", "dotted")) +
  scale_size_manual(values = c(1, 0.7))+
  guides(colour=guide_legend(title="Model"), alpha=FALSE, linetype=FALSE) + xlab("") + ylab("") + theme(legend.position="none")

immo_nonlin1
dev.off()

if(store_plots==T) postscript(file = "./immo/immo2_nonlin2.eps", width=8, height=6,horizontal = FALSE)

immo_nonlin2 <- ggplot(gg.data2, aes(x=x, y=value)) + geom_line(aes(linetype=factor(key),colour=factor(source), size=source), lineend="round") + 
  facet_wrap(param ~ var ,scales="free", labeller=label_parsed)+
  scale_colour_manual(values=c("red", "dodgerblue3")) + scale_alpha_manual(values=c(1,0.8)) + 
  scale_linetype_manual(values=c("solid", "dotted", "dotted")) +
  scale_size_manual(values=c(1,0.7),guide=FALSE)+
  guides(colour=guide_legend(title="Model"), alpha=FALSE, linetype=FALSE) + xlab("") + ylab("")
immo_nonlin2
dev.off()


# linear effects
y1.mu.lin$parameter <- y1.mu.lin.full$parameter <- y2.mu.lin$parameter <- y2.mu.lin.full$parameter <- "mu"
y1.sigma2.lin$parameter <- y1.sigma2.lin.full$parameter <-  y2.sigma2.lin$parameter <- y2.sigma2.lin.full$parameter<- "sigma^2"

y1.mu.lin$level  <- y1.mu.lin.full$level <- y1.sigma2.lin$level <- y1.sigma2.lin.full$level <- "level1"
y2.mu.lin$level <- y2.mu.lin.full$level <-  y2.sigma2.lin$level <- y2.sigma2.lin.full$level <- "level2"

y1.mu.lin$source <- y2.mu.lin$source <-  y1.sigma2.lin$source <- y2.sigma2.lin$source <- "NBPSS"
y1.mu.lin.full$source <- y2.mu.lin.full$source <- y1.sigma2.lin.full$source <-  y2.sigma2.lin.full$source <- "Full Model"
y1.mu.lin.full <- y1.mu.lin.full[-1,]
y1.sigma2.lin.full <- y1.sigma2.lin.full[-1,]
data.lin1 <- rbind(y1.mu.lin, y1.mu.lin.full,
                            y1.sigma2.lin, y1.sigma2.lin.full)

data.lin2 <- rbind(y2.mu.lin, y2.mu.lin.full,
              y2.sigma2.lin, y2.sigma2.lin.full)

data.lin1$varname <- rep(c("arealiv","areapl","yoc","rating"),4)
data.lin2$varname <- rep(c("bar(yoc)", "bar(rating)"), 2)
group_labels <-rep(rev(c(expression(bar(yoc)), expression(bar(rating)))), 2)

if(store_plots==T) postscript(file = "./immo/immo_lin1.eps", width=6.6, height=3,horizontal = FALSE)

immo_lin1 <- ggplot(data.lin1, aes(x=varname,pmean, colour=factor(source, levels=c("NBPSS", "Full Model")) )) +
   geom_point() +
   geom_errorbar(aes(ymax = pqu97p5, ymin = pqu2p5))+
   coord_flip()+
  #+ theme_minimal(base_size = 8)
   facet_grid(level ~ parameter, labeller = label_parsed) + ylab("Posterior Mean")+ xlab("")+
    scale_colour_manual(values=c("red", "dodgerblue3")) + scale_alpha_manual(values=c(1,0.7)) + 
   theme(legend.position="none")
immo_lin1
dev.off()

if(store_plots==T) postscript(file = "./immo/immo_lin2.eps",width=6, height=2, horizontal = FALSE)

immo_lin2 <- ggplot(data.lin2, aes(x=varname,pmean, colour=factor(source, levels=c("NBPSS", "Full Model")) )) +
   geom_point() +
   geom_errorbar(aes(ymax = pqu97p5, ymin = pqu2p5))+
   coord_flip()+
  #+ theme_minimal(base_size = 8)
   facet_grid(level ~ parameter, labeller = label_parsed) + ylab("Posterior Mean")+ xlab("")+
    scale_colour_manual(values=c("red", "dodgerblue3")) + scale_alpha_manual(values=c(1,0.8)) + 
    guides(colour=guide_legend(title="Model"))+
  scale_x_discrete(labels=group_labels)
immo_lin2
dev.off()


########### spatial plot
map <- read.bnd("immo/data/map4.bnd")
#map2 <- bnd2gra(map)
# map2 <- read.gra("immo/data/map4.gra")
ord <- y2.mu.spat.kgs05a$kgs05a

#mu2.spat <- y2.mu.spat.kgs05a$pmean[ord]
mu.2.spat <- y2.mu.spat.kgs05a$pmean

limmax <- max(max(mu.2.spat))
limmin <- min(min(mu.2.spat))
#limmax <- max(max(xi1), max(xi2))
#limmin <- min(min(xi1), min(xi2))
limmax <- 0.1 * ceiling(10*limmax)
limmin <- 0.1 * floor(10*limmin)
limmin <- sign(limmin) * max(limmax, -limmin)
limmax <- sign(limmax) * max(limmax, -limmin)
par(mar=c(4,4,2,1)+0.1, oma = c(0,0,0,0))
#data <- data.frame(intnr = seq(1, length(states)), states = as.character(states), x = rho1)
data <- data.frame(intnr = y2.mu.spat.kgs05a$intnr, states = as.character(y2.mu.spat.kgs05a$kgs05a), x = y2.mu.spat.kgs05a$pmean + y1.mu.random$pmean)

# if(store_plots==T) postscript(file = paste0("./immo/immo_maps.eps"), horizontal = FALSE)
# if(store_plots==T) pdf(file = paste0("./immo/immo_maps.pdf"))
if(store_plots==T) png(file = paste0("./immo/immo_maps.png"),width=480*1.5, height=480*1.8)

layout(matrix(c(1,2,3,4,5,5),nrow = 3, byrow = TRUE), widths = c(1,1,0.5), heights = c(0.5,0.5,0.1))
data <- data.frame(intnr = y2.mu.spat.kgs05a$intnr, states = as.character(y2.mu.spat.kgs05a$kgs05a), x = y2.mu.spat.kgs05a$pmean + y1.mu.random$pmean)
drawmap(data = data, map = map, drawnames = FALSE, plotvar = "x", swapcolors = TRUE, limits = c(limmin, limmax), hcl.par = list(h = c(250, 0), c = 80, l = c(50, 95), power = 1.2), legend = FALSE, main = expression(NBPSS: mu))
data <- data.frame(intnr = y2.mu.spat.kgs05a.full$intnr, states = as.character(y2.mu.spat.kgs05a.full$kgs05a), x = y2.mu.spat.kgs05a.full$pmean + y1.mu.random.full$pmean)
drawmap(data = data, map = map, drawnames = FALSE, plotvar = "x", swapcolors = TRUE, limits = c(limmin, limmax), hcl.par = list(h = c(250, 0), c = 80, l = c(50, 95), power = 1.2), legend = FALSE, main = expression(Full~Model: mu))
data <- data.frame(intnr = y2.sigma2.spat.kgs4a$intnr, states = as.character(y2.sigma2.spat.kgs4a$kgs4a), x = y2.sigma2.spat.kgs4a$pmean + y1.sigma2.random$pmean)
drawmap(data = data, map = map, drawnames = FALSE, plotvar = "x", swapcolors = TRUE, limits = c(limmin, limmax), hcl.par = list(h = c(250, 0), c = 80, l = c(50, 95), power = 1.2), legend = FALSE, main = expression(NBPSS: sigma^2))
data <- data.frame(intnr = y2.sigma2.spat.kgs4a.full$intnr, states = as.character(y2.sigma2.spat.kgs4a.full$kgs4a), x = y2.sigma2.spat.kgs4a.full$pmean + y1.sigma2.random.full$pmean)
drawmap(data = data, map = map, drawnames = FALSE, plotvar = "x", swapcolors = TRUE, limits = c(limmin, limmax), hcl.par = list(h = c(250, 0), c = 80, l = c(50, 95), power = 1.2), legend = FALSE, main = expression(Full~Model: sigma^2))


par(mar=c(0,0,0,0))
legend_map(c(limmin,limmax), window.scale=4)
par(mar=c(4,4,2,1)+0.1)
dev.off()


sigma2.spat <- y2.sigma2.spat.kgs4a$pmean

limmax <- max(max(sigma2.spat))
limmin <- min(min(sigma2.spat))
#limmax <- max(max(xi1), max(xi2))
#limmin <- min(min(xi1), min(xi2))
limmax <- 0.1 * ceiling(10*limmax)
limmin <- 0.1 * floor(10*limmin)
limmin <- sign(limmin) * max(limmax, -limmin)
limmax <- sign(limmax) * max(limmax, -limmin)
par(mar=c(4,4,2,1)+0.1, oma = c(0,0,0,0))
#data <- data.frame(intnr = seq(1, length(states)), states = as.character(states), x = rho1)
data <- data.frame(intnr = y2.sigma2.spat.kgs4a$intnr, states = as.character(y2.sigma2.spat.kgs4a$kgs4a), x = y2.sigma2.spat.kgs4a$pmean + y1.sigma2.random$pmean)

if(store_plots==T) postscript(file = paste0("./immo/immo_map_sigma.eps"), horizontal = FALSE)
layout(matrix(c(1,2,3,4),nrow = 2, byrow = TRUE), widths = c(1), heights = c(1,0.2))
drawmap(data = data, map = map, drawnames = FALSE, plotvar = "x", swapcolors = TRUE, limits = c(limmin, limmax), hcl.par = list(h = c(250, 0), c = 80, l = c(50, 95), power = 1.2), legend = FALSE, main = expression(level2: sigma))

par(mar=c(0,0,0,0))
legend_map(c(limmin,limmax), window.scale=4)
par(mar=c(4,4,2,1)+0.1)


dev.off()

########################################################################################################################
################## Construct nonlinear effect - level 1
########################################################################################################################
basisz_baujahr1 <- source("immo/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_baujahr_s_basisR.res")
basisz_grstfl1 <- source("immo/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_grstfl_s_basisR.res")
basisz_rating1 <- source("immo/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_rating_s_basisR.res")
basisz_wfl1 <- source("immo/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_wfl_s_basisR.res")

basisz_baujahr2 <- source("immo/results/effsel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_baujahr_s_basisR.res")
basisz_rating2 <- source("immo/results/effsel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_rating_s_basisR.res")



Z.baujahr1 <- basisz_baujahr1[[1]](baujahr1)
Z.grstfl1 <- basisz_grstfl1[[1]](grstfl1)
Z.rating1 <- basisz_rating1[[1]](rating1)
Z.wfl1 <- basisz_wfl1[[1]](wfl1)


params <- c("mu", "sigma2")
#levels <- c("wasting2", "stunting2")
kovars <- c("baujahr_s", "grstfl_s", "rating_s", "wfl_s")
kovars_unsc <- c("baujahr1_unsc", "grstfl1_unsc", "rating1_unsc", "wfl1_unsc")
effs <- expand.grid(params, kovars)
effs <- cbind(effs, rep(kovars_unsc, each=2))
#effs <- effs[!(effs$Var1 == "rho" & effs$Var2 == "stunting2"),]

baujahr_s <- baujahr1
rating_s <- rating1
grstfl_s <- grstfl1
wfl_s <- wfl1

Z.baujahr_s <- basisz_baujahr1[[1]](baujahr1)
Z.grstfl_s <- basisz_grstfl1[[1]](grstfl1)
Z.rating_s <- basisz_rating1[[1]](rating1)
Z.wfl_s <- basisz_wfl1[[1]](wfl1)


ggEffFun <- function(i){

param <- as.character(effs[i,1])
var <- as.character(effs[i,2])
kovar <- as.character(effs[i,2])
kovar_unsc <- as.character(effs[i,3])


lin.sample.var.param <- read.table(paste0("immo/results/effsel_",param,"_level1_MAIN_",param,"_REGRESSION_pqm_s_LinearEffects_ssvs_sample.raw"), header=T)

colnames(lin.sample.var.param) <- c("intnr","wfl_s", "grstfl_s", "baujahr_s", "rating_s")

samp.dat <- read.table(paste0("immo/results/effsel_",param,"_level1_MAIN_", param, "_REGRESSION_pqm_s_nonlinear_pspline_effect_of_", kovar,"_sample.raw"), header=T)

kv <- unique(get(kovar))
kv_unsc <- unique(get(kovar_unsc))

# multiply beta coefficient of each sample with covariate to get 1000 samples of linear effects
lin.samp <- lapply(lin.sample.var.param[,kovar], function(x) x* kv)

# 1000 samples in columns
lin.samp <- do.call(cbind, lin.samp)

# 1000 samples of nonlinear effect in columns
sm.samp <- get(paste0("Z.",kovar)) %*% t(samp.dat[,-1])

lin.samp.nbpss <- lin.samp
sm.samp.nbpss <- sm.samp


eff <- scale(lin.samp + sm.samp)


eff.dat <- data.frame(pmean=apply(t(eff), 2, mean),
                 pqu2p5 =apply(t(eff), 2, function(x) quantile(x, prob=c(0.025))),
                 pqu97p5 =apply(t(eff), 2, function(x) quantile(x, prob=c(0.975))))


eff.dat <- cbind(x=kv_unsc, gather(eff.dat), source="NPBSS", kovar=kovar, param, var, param_var=paste0(param, " - ", var))



lin.sample.var.param <- read.table(paste0("immo/results/fullmodel_",param,"_level1_MAIN_",param,"_REGRESSION_pqm_s_LinearEffects_sample.raw"), header=T)

colnames(lin.sample.var.param) <- c("intnr","const", "wfl_s", "grstfl_s", "baujahr_s", "rating_s")

samp.dat <- read.table(paste0("immo/results/fullmodel_",param,"_level1_MAIN_", param, "_REGRESSION_pqm_s_nonlinear_pspline_effect_of_", kovar,"_sample.raw"), header=T)

kv <- unique(get(kovar))
kv_unsc <- unique(get(kovar_unsc))

# multiply beta coefficient of each sample with covariate to get 1000 samples of linear effects
lin.samp <- lapply(lin.sample.var.param[,kovar], function(x) x* kv)

# 1000 samples in columns
lin.samp <- do.call(cbind, lin.samp)

# 1000 samples of nonlinear effect in columns
sm.samp <- get(paste0("Z.",kovar)) %*% t(samp.dat[,-1])


eff <- scale(lin.samp + sm.samp)

eff.dat.full <- data.frame(pmean=apply(t(eff), 2, mean),
                 pqu2p5 =apply(t(eff), 2, function(x) quantile(x, prob=c(0.025))),
                 pqu97p5 =apply(t(eff), 2, function(x) quantile(x, prob=c(0.975))))


eff.dat.full <- cbind(x=kv_unsc, gather(eff.dat.full), source="Full Model", kovar=kovar, param, var, param_var=paste0(param, " - ", var))

################# 

dat <- rbind(eff.dat, eff.dat.full)

print(i)
return(dat)
}
gg <- lapply(1:nrow(effs), ggEffFun)

gg.dat <- do.call(rbind, gg)

gg.dat$param <- as.character(gg.dat$param)
gg.dat$param[which(gg.dat$param == "sigma2")] <- "sigma^2"
gg.dat$kovar <-substr(gg.dat$kovar, 1, nchar(as.character(gg.dat$kovar))-2)
gg.dat$kovar[gg.dat$kovar == "baujahr"] <- "yoc"
gg.dat$kovar[gg.dat$kovar == "grstfl"] <- "areapl"
gg.dat$kovar[gg.dat$kovar == "wfl"] <- "arealiv"
gg.dat$kovar_f <- factor(gg.dat$kovar,  levels=c("yoc","rating","areapl","arealiv"))



gg.dat$param <- paste0("level1: ",gg.dat$param)


if(store_plots==T) postscript(file = ("./immo/immo_nonlin_whole1.eps"),width=11, height=7,paper="special", horizontal = T)

immo_nonlin_whole1 <-ggplot(gg.dat, aes(x=x, y=value)) + geom_line(aes(linetype=factor(key),colour=as.factor(source))) + 
  facet_wrap(param ~ factor(kovar_f, levels=(c("yoc","rating","areapl","arealiv"))),ncol=4,scales="free", labeller=label_parsed)+
  scale_colour_manual(values=c("red", "dodgerblue3")) + scale_alpha_manual(values=c(1,0.8)) + 
  scale_linetype_manual(values=c("solid", "dotted", "dotted")) +
  guides(colour=guide_legend(title="Model"), alpha=FALSE, linetype=FALSE) + xlab("") + ylab("")+theme(legend.position="none")
print(immo_nonlin_whole1)
dev.off()

########################################################################################################################
################## Construct nonlinear effect - level2
########################################################################################################################

basisz_baujahr2 <- source("immo/results/effsel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_baujahr_s_basisR.res")
basisz_rating2 <- source("immo/results/effsel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_rating_s_basisR.res")

Z.baujahr2 <- basisz_baujahr2[[1]](baujahr2)
Z.rating2 <- basisz_rating2[[1]](rating2)
rating2_unsc <- rating2_unsc2

params <- c("mu", "sigma2")
kovars <- c("baujahr_s",  "rating_s")
kovars_unsc <- c("baujahr2_unsc", "rating2_unsc")

effs <- expand.grid(params, kovars)
effs <- cbind(effs, rep(kovars_unsc, each=2))


Z.baujahr_s <- basisz_baujahr2[[1]](baujahr2)
Z.rating_s <- basisz_rating2[[1]](rating2)

baujahr_s <- baujahr2
rating_s <- rating2

ggEffFun <- function(i){

param <- as.character(effs[i,1])
var <- as.character(effs[i,2])
kovar <- as.character(effs[i,2])
kovar_unsc <- as.character(effs[i,3])





lin.sample.var.param <- read.table(paste0("immo/results/effsel_",param,"_level2_RANDOM_EFFECTS_",param,"_LinearEffects_ssvs_sample.raw"), header=T)

colnames(lin.sample.var.param) <- c("intnr","baujahr_s", "rating_s")

samp.dat <- read.table(paste0("immo/results/effsel_",param,"_level2_RANDOM_EFFECTS_", param, "_nonlinear_pspline_effect_of_", kovar,"_sample.raw"), header=T)

kv <- unique(get(kovar))
kv_unsc <- unique(get(kovar_unsc))
# multiply beta coefficient of each sample with covariate to get 1000 samples of linear effects
lin.samp <- lapply(lin.sample.var.param[,kovar], function(x) x* kv)

# 1000 samples in columns
lin.samp <- do.call(cbind, lin.samp)

# 1000 samples of nonlinear effect in columns
sm.samp <- get(paste0("Z.",kovar)) %*% t(samp.dat[,-1])


eff <-scale((lin.samp +sm.samp), scale=F)

eff.dat <- data.frame(pmean=apply(t(eff), 2, mean),
                 pqu2p5 =apply(t(eff), 2, function(x) quantile(x, prob=c(0.025))),
                 pqu97p5 =apply(t(eff), 2, function(x) quantile(x, prob=c(0.975))))


eff.dat <- cbind(x=kv_unsc, gather(eff.dat), source="NPBSS", kovar=kovar, param, var, param_var=paste0(param, " - ", var))



lin.sample.var.param <- read.table(paste0("immo/results/fullmodel_",param,"_level2_RANDOM_EFFECTS_",param,"_LinearEffects_sample.raw"), header=T)

colnames(lin.sample.var.param) <- c("intnr", "baujahr_s", "rating_s")

samp.dat <- read.table(paste0("immo/results/fullmodel_",param,"_level2_RANDOM_EFFECTS_", param, "_nonlinear_pspline_effect_of_", kovar,"_sample.raw"), header=T)

kv <- unique(get(kovar))
kv_unsc <- unique(get(kovar_unsc))

# multiply beta coefficient of each sample with covariate to get 1000 samples of linear effects
lin.samp <- lapply(lin.sample.var.param[,kovar], function(x) x* kv)

# 1000 samples in columns
lin.samp <- do.call(cbind, lin.samp)

# 1000 samples of nonlinear effect in columns
sm.samp <- get(paste0("Z.",kovar)) %*% t(samp.dat[,-1])


eff <-scale((lin.samp +sm.samp), scale=F)


eff.dat.full <- data.frame(pmean=apply(t(eff), 2, mean),
                 pqu2p5 =apply(t(eff), 2, function(x) quantile(x, prob=c(0.025))),
                 pqu97p5 =apply(t(eff), 2, function(x) quantile(x, prob=c(0.975))))

eff.dat.full <- cbind(x=kv_unsc, gather(eff.dat.full), source="Full Model", kovar=kovar, param, var, param_var=paste0(param, " - ", var))

################# 

dat <- rbind(eff.dat, eff.dat.full)

return(dat)
}
gg <- lapply(1:nrow(effs), ggEffFun)

gg.dat <- do.call(rbind, gg)

gg.dat$param <- as.character(gg.dat$param)
gg.dat$param[which(gg.dat$param == "sigma2")] <- "sigma^2"
gg.dat$kovar <-substr(gg.dat$kovar, 1, nchar(as.character(gg.dat$kovar))-2)
gg.dat$param <- paste0("level2: ",gg.dat$param)
gg.dat$kovar[gg.dat$kovar == "baujahr"] <- "bar(yoc)"
gg.dat$kovar[gg.dat$kovar == "baujahr_s"] <- "bar(yoc)"
gg.dat$kovar[gg.dat$kovar == "rating"] <- "bar(rating)"
gg.dat$kovar_f <- factor(gg.dat$kovar,  levels=rev(c("bar(yoc)","bar(rating)")))


if(store_plots==T) postscript(file = ("./immo/immo_nonlin_whole2.eps"),width=8,height=6, horizontal = T)

immo_nonlin_whole2 <-ggplot(gg.dat, aes(x=x, y=value)) + geom_line(aes(linetype=factor(key),colour=as.factor(source))) + 
  facet_wrap(param ~ factor(kovar_f, levels=c("bar(yoc)", "bar(rating)")) ,scales="free", labeller=label_parsed)+
  scale_colour_manual(values=c("red", "dodgerblue3")) + scale_alpha_manual(values=c(1,0.8)) + 
  scale_linetype_manual(values=c("solid", "dotted", "dotted")) +
  guides(colour=guide_legend(title="Model"), alpha=FALSE, linetype=FALSE) + xlab("") + ylab("")
immo_nonlin_whole2
dev.off()


