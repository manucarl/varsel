clear
infile intnr wfl_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_wfl_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 wfl_s, bcolor(gs13) || rarea pqu10 pqu90 wfl_s , bcolor(gs10) || /*
 */ scatter pmean wfl_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of wfl_s") xtitle("wfl_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_wfl_s_statagraph.eps, replace

sleep 1000

clear
infile intnr grstfl_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_grstfl_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 grstfl_s, bcolor(gs13) || rarea pqu10 pqu90 grstfl_s , bcolor(gs10) || /*
 */ scatter pmean grstfl_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of grstfl_s") xtitle("grstfl_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_grstfl_s_statagraph.eps, replace

sleep 1000

clear
infile intnr baujahr_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_baujahr_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 baujahr_s, bcolor(gs13) || rarea pqu10 pqu90 baujahr_s , bcolor(gs10) || /*
 */ scatter pmean baujahr_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of baujahr_s") xtitle("baujahr_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_baujahr_s_statagraph.eps, replace

sleep 1000

clear
infile intnr rating_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_rating_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 rating_s, bcolor(gs13) || rarea pqu10 pqu90 rating_s , bcolor(gs10) || /*
 */ scatter pmean rating_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of rating_s") xtitle("rating_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_nonlinear_pspline_effect_of_rating_s_statagraph.eps, replace

sleep 1000

clear
infile intnr kgs5 pmean_tot pqu2p5_tot  pqu10_tot pmed_tot pqu90_tot pqu97p5_tot pcat95_tot pcat80_tot pqu2p5sim_tot  pqu10sim_tot pqu90sim_tot pqu97p5sim_tot pcat95sim_tot pcat80sim_tot pmean pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 pqu2p5_sim pqu10_sim pqu90_sim pqu97p5_sim pcat95_sim pcat80_sim using /home/mcarlan/VarSel/immo2/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_random_effect_of_kgs5.res
drop in 1
kdensity pmean_tot
graph export /home/mcarlan/VarSel/immo2/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_random_effect_of_kgs5_statagraph_tot.eps, replace

kdensity pmean
graph export /home/mcarlan/VarSel/immo2/results/effsel_mu_level1_MAIN_mu_REGRESSION_pqm_s_random_effect_of_kgs5_statagraph.eps, replace

clear
infile intnr baujahr_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_baujahr_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 baujahr_s, bcolor(gs13) || rarea pqu10 pqu90 baujahr_s , bcolor(gs10) || /*
 */ scatter pmean baujahr_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of baujahr_s") xtitle("baujahr_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_baujahr_s_statagraph.eps, replace

sleep 1000

clear
infile intnr rating_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_rating_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 rating_s, bcolor(gs13) || rarea pqu10 pqu90 rating_s , bcolor(gs10) || /*
 */ scatter pmean rating_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of rating_s") xtitle("rating_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_mu_level2_RANDOM_EFFECTS_mu_nonlinear_pspline_effect_of_rating_s_statagraph.eps, replace

sleep 1000

clear
infile intnr kgs05a pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_mu_level2_RANDOM_EFFECTS_mu_spatial_MRF_effect_of_kgs05a.res
drop in 1
kdensity pmean
graph export /home/mcarlan/VarSel/immo2/results/effsel_mu_level2_RANDOM_EFFECTS_mu_spatial_MRF_effect_of_kgs05a_statagraph.eps, replace

sleep 1000

clear
infile intnr wfl_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_wfl_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 wfl_s, bcolor(gs13) || rarea pqu10 pqu90 wfl_s , bcolor(gs10) || /*
 */ scatter pmean wfl_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of wfl_s") xtitle("wfl_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_wfl_s_statagraph.eps, replace

sleep 1000

clear
infile intnr grstfl_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_grstfl_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 grstfl_s, bcolor(gs13) || rarea pqu10 pqu90 grstfl_s , bcolor(gs10) || /*
 */ scatter pmean grstfl_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of grstfl_s") xtitle("grstfl_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_grstfl_s_statagraph.eps, replace

sleep 1000

clear
infile intnr baujahr_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_baujahr_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 baujahr_s, bcolor(gs13) || rarea pqu10 pqu90 baujahr_s , bcolor(gs10) || /*
 */ scatter pmean baujahr_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of baujahr_s") xtitle("baujahr_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_baujahr_s_statagraph.eps, replace

sleep 1000

clear
infile intnr rating_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_rating_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 rating_s, bcolor(gs13) || rarea pqu10 pqu90 rating_s , bcolor(gs10) || /*
 */ scatter pmean rating_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of rating_s") xtitle("rating_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_nonlinear_pspline_effect_of_rating_s_statagraph.eps, replace

sleep 1000

clear
infile intnr kgs4 pmean_tot pqu2p5_tot  pqu10_tot pmed_tot pqu90_tot pqu97p5_tot pcat95_tot pcat80_tot pqu2p5sim_tot  pqu10sim_tot pqu90sim_tot pqu97p5sim_tot pcat95sim_tot pcat80sim_tot pmean pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 pqu2p5_sim pqu10_sim pqu90_sim pqu97p5_sim pcat95_sim pcat80_sim using /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_random_effect_of_kgs4.res
drop in 1
kdensity pmean_tot
graph export /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_random_effect_of_kgs4_statagraph_tot.eps, replace

kdensity pmean
graph export /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level1_MAIN_sigma2_REGRESSION_pqm_s_random_effect_of_kgs4_statagraph.eps, replace

clear
infile intnr baujahr_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level2_RANDOM_EFFECTS_sigma2_nonlinear_pspline_effect_of_baujahr_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 baujahr_s, bcolor(gs13) || rarea pqu10 pqu90 baujahr_s , bcolor(gs10) || /*
 */ scatter pmean baujahr_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of baujahr_s") xtitle("baujahr_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level2_RANDOM_EFFECTS_sigma2_nonlinear_pspline_effect_of_baujahr_s_statagraph.eps, replace

sleep 1000

clear
infile intnr rating_s pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level2_RANDOM_EFFECTS_sigma2_nonlinear_pspline_effect_of_rating_s.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 rating_s, bcolor(gs13) || rarea pqu10 pqu90 rating_s , bcolor(gs10) || /*
 */ scatter pmean rating_s, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of rating_s") xtitle("rating_s") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level2_RANDOM_EFFECTS_sigma2_nonlinear_pspline_effect_of_rating_s_statagraph.eps, replace

sleep 1000

clear
infile intnr kgs4a pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level2_RANDOM_EFFECTS_sigma2_spatial_MRF_effect_of_kgs4a.res
drop in 1
kdensity pmean
graph export /home/mcarlan/VarSel/immo2/results/effsel_sigma2_level2_RANDOM_EFFECTS_sigma2_spatial_MRF_effect_of_kgs4a_statagraph.eps, replace

sleep 1000

