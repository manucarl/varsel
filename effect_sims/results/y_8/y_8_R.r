library("BayesX")

plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x1.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x2.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x3.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x4.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x5.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x6.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x7.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x8.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x9.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x10.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x11.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x12.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x13.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x14.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x15.res", y=c(3,5,6,9,8))
plotnonp("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_nonlinear_pspline_effect_of_x16.res", y=c(3,5,6,9,8))
Replace pathtomap with the actual path to file containing the map in bnd format
m <- read.bnd("pathtothemap")
drawmap("/home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_8/y_8_MAIN_mu_REGRESSION_y8_spatial_MRF_effect_of_region.res",map=m)
