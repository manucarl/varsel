clear
infile intnr x1 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x1.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x1, bcolor(gs13) || rarea pqu10 pqu90 x1 , bcolor(gs10) || /*
 */ scatter pmean x1, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x1") xtitle("x1") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x1_statagraph.eps, replace

sleep 1000

clear
infile intnr x2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x2, bcolor(gs13) || rarea pqu10 pqu90 x2 , bcolor(gs10) || /*
 */ scatter pmean x2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x2") xtitle("x2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x2_statagraph.eps, replace

sleep 1000

clear
infile intnr x3 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x3.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x3, bcolor(gs13) || rarea pqu10 pqu90 x3 , bcolor(gs10) || /*
 */ scatter pmean x3, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x3") xtitle("x3") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x3_statagraph.eps, replace

sleep 1000

clear
infile intnr x4 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x4.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x4, bcolor(gs13) || rarea pqu10 pqu90 x4 , bcolor(gs10) || /*
 */ scatter pmean x4, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x4") xtitle("x4") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x4_statagraph.eps, replace

sleep 1000

clear
infile intnr x5 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x5.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x5, bcolor(gs13) || rarea pqu10 pqu90 x5 , bcolor(gs10) || /*
 */ scatter pmean x5, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x5") xtitle("x5") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x5_statagraph.eps, replace

sleep 1000

clear
infile intnr x6 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x6.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x6, bcolor(gs13) || rarea pqu10 pqu90 x6 , bcolor(gs10) || /*
 */ scatter pmean x6, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x6") xtitle("x6") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x6_statagraph.eps, replace

sleep 1000

clear
infile intnr x7 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x7.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x7, bcolor(gs13) || rarea pqu10 pqu90 x7 , bcolor(gs10) || /*
 */ scatter pmean x7, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x7") xtitle("x7") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x7_statagraph.eps, replace

sleep 1000

clear
infile intnr x8 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x8.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x8, bcolor(gs13) || rarea pqu10 pqu90 x8 , bcolor(gs10) || /*
 */ scatter pmean x8, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x8") xtitle("x8") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x8_statagraph.eps, replace

sleep 1000

clear
infile intnr x9 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x9.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x9, bcolor(gs13) || rarea pqu10 pqu90 x9 , bcolor(gs10) || /*
 */ scatter pmean x9, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x9") xtitle("x9") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x9_statagraph.eps, replace

sleep 1000

clear
infile intnr x10 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x10.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x10, bcolor(gs13) || rarea pqu10 pqu90 x10 , bcolor(gs10) || /*
 */ scatter pmean x10, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x10") xtitle("x10") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x10_statagraph.eps, replace

sleep 1000

clear
infile intnr x11 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x11.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x11, bcolor(gs13) || rarea pqu10 pqu90 x11 , bcolor(gs10) || /*
 */ scatter pmean x11, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x11") xtitle("x11") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x11_statagraph.eps, replace

sleep 1000

clear
infile intnr x12 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x12.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x12, bcolor(gs13) || rarea pqu10 pqu90 x12 , bcolor(gs10) || /*
 */ scatter pmean x12, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x12") xtitle("x12") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x12_statagraph.eps, replace

sleep 1000

clear
infile intnr x13 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x13.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x13, bcolor(gs13) || rarea pqu10 pqu90 x13 , bcolor(gs10) || /*
 */ scatter pmean x13, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x13") xtitle("x13") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x13_statagraph.eps, replace

sleep 1000

clear
infile intnr x14 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x14.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x14, bcolor(gs13) || rarea pqu10 pqu90 x14 , bcolor(gs10) || /*
 */ scatter pmean x14, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x14") xtitle("x14") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x14_statagraph.eps, replace

sleep 1000

clear
infile intnr x15 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x15.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x15, bcolor(gs13) || rarea pqu10 pqu90 x15 , bcolor(gs10) || /*
 */ scatter pmean x15, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x15") xtitle("x15") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x15_statagraph.eps, replace

sleep 1000

clear
infile intnr x16 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x16.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 x16, bcolor(gs13) || rarea pqu10 pqu90 x16 , bcolor(gs10) || /*
 */ scatter pmean x16, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of x16") xtitle("x16") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_nonlinear_pspline_effect_of_x16_statagraph.eps, replace

sleep 1000

clear
infile intnr region pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_spatial_MRF_effect_of_region.res
drop in 1
kdensity pmean
graph export /home/mcarlan/VarSel/results/normal/n200_unsparse_notspatial_cor0_alpha0.05_c0.1/y_13/y_13_MAIN_mu_REGRESSION_y13_spatial_MRF_effect_of_region_statagraph.eps, replace

sleep 1000

