wd <- getwd()
setwd("./immo/results/")

y1.mu.lin <- read.table("effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_LinearEffects_ssvs.res", header = TRUE)
y1.mu.baujahr <- read.table("effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_baujahr_s.res", header = TRUE)
y1.mu.grstfl <- read.table("effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_grstfl_s.res", header = TRUE)
y1.mu.rating <- read.table("effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_rating_s.res", header = TRUE)
y1.mu.wfl <- read.table("effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_wfl_s.res", header = TRUE)
y1.mu.random <- read.table("effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_random_effect_of_kgs5.res",header=TRUE)

y1.mu.lin.full <- read.table("fullmodel_mu_level1_MAIN_mu_REGRESSION_pqm_s_LinearEffects.res", header = TRUE)
y1.mu.baujahr.full <- read.table("fullmodel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_baujahr_s.res", header = TRUE)
y1.mu.grstfl.full <- read.table("fullmodel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_grstfl_s.res", header = TRUE)
y1.mu.rating.full <- read.table("fullmodel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_rating_s.res", header = TRUE)
y1.mu.wfl.full <- read.table("fullmodel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_wfl_s.res", header = TRUE)
y1.mu.random.full <- read.table("fullmodel_mu_level1_MAIN_mu_REGRESSION_pqm_s_random_effect_of_kgs5.res",header=TRUE)

y2.mu.lin <-  read.table("effsel_mu_level2_RANDOM_EFFECTS_mu_LinearEffects_ssvs.res", header = TRUE)
y2.mu.baujahr <- read.table("effsel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_baujahr_s.res", header = TRUE)
y2.mu.rating <- read.table("effsel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_rating_s.res", header=T)

y2.mu.spat.kgs05a <- read.table("effsel_mu_level2_RANDOM_EFFECTS_mu_spatial_MRF_effect_of_kgs05a.res", header=T)
#setwd("C:/Studies/HypChoice/immo/new results complete/results")

y2.mu.lin.full <-  read.table("fullmodel_mu_level2_RANDOM_EFFECTS_mu_LinearEffects.res", header = TRUE)
y2.mu.baujahr.full <- read.table("fullmodel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_baujahr_s.res", header = TRUE)
y2.mu.rating.full <- read.table("fullmodel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_rating_s.res", header=T)

y2.mu.spat.kgs05a.full <- read.table("fullmodel_mu_level2_RANDOM_EFFECTS_mu_spatial_MRF_effect_of_kgs05a.res", header=T)
#setwd("C:/Studies/HypChoice/immo2/results/")

y1.sigma2.lin <- read.table("effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_LinearEffects_ssvs.res", header=T)
y1.sigma2.baujahr <- read.table("effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_baujahr_s.res" ,header=T)
y1.sigma2.grstfl <- read.table("effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_grstfl_s.res" ,header=T)
y1.sigma2.rating <- read.table("effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_rating_s.res" ,header=T)
y1.sigma2.wfl <- read.table("effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_wfl_s.res", header=T)
y1.sigma2.random <- read.table("effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_random_effect_of_kgs4.res", header=T)

#setwd("C:/Studies/HypChoice/immo/new results complete/results")

y1.sigma2.lin.full <- read.table("fullmodel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_LinearEffects.res", header=T)
y1.sigma2.baujahr.full <- read.table("fullmodel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_baujahr_s.res" ,header=T)
y1.sigma2.grstfl.full <- read.table("fullmodel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_grstfl_s.res" ,header=T)
y1.sigma2.rating.full <- read.table("fullmodel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_rating_s.res" ,header=T)
y1.sigma2.wfl.full <- read.table("fullmodel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_wfl_s.res", header=T)
y1.sigma2.random.full <- read.table("fullmodel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_random_effect_of_kgs4.res", header=T)
#setwd("C:/Studies/HypChoice/immo2/results/")

y2.sigma2.lin <- read.table("effsel_sigma2_level2_RANDOM_EFFECTS_sigma2_LinearEffects_ssvs.res", header=T)
y2.sigma2.baujahr <- read.table("effsel_sigma2_level2_RANDOM_EFFECTS_sigma2_nonlinear_pspline_effect_of_baujahr_s.res", header=T)
y2.sigma2.rating <- read.table("effsel_sigma2_level2_RANDOM_EFFECTS_sigma2_nonlinear_pspline_effect_of_rating_s.res",header=T)
y2.sigma2.spat.kgs4a <- read.table("effsel_sigma2_level2_RANDOM_EFFECTS_sigma2_spatial_MRF_effect_of_kgs4a.res", header=T)
#setwd("C:/Studies/HypChoice/immo/new results complete/results")

y2.sigma2.lin.full <- read.table("fullmodel_sigma2_level2_RANDOM_EFFECTS_sigma2_LinearEffects.res", header=T)
y2.sigma2.baujahr.full <- read.table("fullmodel_sigma2_level2_RANDOM_EFFECTS_sigma2_nonlinear_pspline_effect_of_baujahr_s.res", header=T)
y2.sigma2.rating.full <- read.table("fullmodel_sigma2_level2_RANDOM_EFFECTS_sigma2_nonlinear_pspline_effect_of_rating_s.res",header=T)
y2.sigma2.spat.kgs4a.full <- read.table("fullmodel_sigma2_level2_RANDOM_EFFECTS_sigma2_spatial_MRF_effect_of_kgs4a.res", header=T)

setwd(wd)