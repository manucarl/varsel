library("BayesX")

plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_wfl_s.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_grstfl_s.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_baujahr_s.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_rating_s.res", y=c(3,5,6,9,8))
dat <- read.table("/home/mcarlan/VarSel/immo2/results/fullmodel_mu_level1_MAIN_mu_REGRESSION_pqm_s_random_effect_of_kgs5.res", header=TRUE)
plot(density(dat$pmean_tot))
plot(density(dat$pmean))

plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_baujahr_s.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_rating_s.res", y=c(3,5,6,9,8))
Replace pathtomap with the actual path to file containing the map in bnd format
m <- read.bnd("pathtothemap")
drawmap("/home/mcarlan/VarSel/immo2/results/fullmodel_mu_level2_RANDOM_EFFECTS_mu_spatial_MRF_effect_of_kgs05a.res",map=m)
plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_wfl_s.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_grstfl_s.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_baujahr_s.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_rating_s.res", y=c(3,5,6,9,8))
dat <- read.table("/home/mcarlan/VarSel/immo2/results/fullmodel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_random_effect_of_kgs4.res", header=TRUE)
plot(density(dat$pmean_tot))
plot(density(dat$pmean))

plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_sigma2_level2_RANDOM_EFFECTS_sigma2_nonlinear_pspline_effect_of_baujahr_s.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/immo2/results/fullmodel_sigma2_level2_RANDOM_EFFECTS_sigma2_nonlinear_pspline_effect_of_rating_s.res", y=c(3,5,6,9,8))
Replace pathtomap with the actual path to file containing the map in bnd format
m <- read.bnd("pathtothemap")
drawmap("/home/mcarlan/VarSel/immo2/results/fullmodel_sigma2_level2_RANDOM_EFFECTS_sigma2_spatial_MRF_effect_of_kgs4a.res",map=m)
