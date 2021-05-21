# Standardizes (remaining) continuous covariates and recodes dummys 
library(BayesX)
dat <- read.table(".../undernutrition/data/nigeria2.raw", header=T)

dat$csex <- ifelse(dat$csex == 0, -1,1)
dat$electricity <- ifelse(dat$electricity == 0, -1,1)
dat$television <- ifelse(dat$television == 0, -1,1)
dat$radio <- ifelse(dat$radio == 0, -1,1)

dat$mweight2 <- scale(dat$mweight)
dat$medu2 <- scale(dat$medu)
dat$edupartner2 <- scale(dat$edupartner)

dat <- dat[, !colnames(dat) %in% paste0("w",1:10)]
write.table(dat, ".../undernutrition/data/nigeria4.raw", quote=FALSE, row.names=F)

