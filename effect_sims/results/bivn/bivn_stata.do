clear
infile intnr mbmi2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_wasting2_nonlinear_pspline_effect_of_mbmi2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 mbmi2, bcolor(gs13) || rarea pqu10 pqu90 mbmi2 , bcolor(gs10) || /*
 */ scatter pmean mbmi2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of mbmi2") xtitle("mbmi2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_wasting2_nonlinear_pspline_effect_of_mbmi2_statagraph.eps, replace

sleep 1000

clear
infile intnr mage2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_wasting2_nonlinear_pspline_effect_of_mage2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 mage2, bcolor(gs13) || rarea pqu10 pqu90 mage2 , bcolor(gs10) || /*
 */ scatter pmean mage2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of mage2") xtitle("mage2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_wasting2_nonlinear_pspline_effect_of_mage2_statagraph.eps, replace

sleep 1000

clear
infile intnr cage2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_wasting2_nonlinear_pspline_effect_of_cage2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 cage2, bcolor(gs13) || rarea pqu10 pqu90 cage2 , bcolor(gs10) || /*
 */ scatter pmean cage2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of cage2") xtitle("cage2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_wasting2_nonlinear_pspline_effect_of_cage2_statagraph.eps, replace

sleep 1000

clear
infile intnr subregion pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_wasting2_spatial_MRF_effect_of_subregion.res
drop in 1
kdensity pmean
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_wasting2_spatial_MRF_effect_of_subregion_statagraph.eps, replace

sleep 1000

clear
infile intnr mbmi2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_stunting2_nonlinear_pspline_effect_of_mbmi2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 mbmi2, bcolor(gs13) || rarea pqu10 pqu90 mbmi2 , bcolor(gs10) || /*
 */ scatter pmean mbmi2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of mbmi2") xtitle("mbmi2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_stunting2_nonlinear_pspline_effect_of_mbmi2_statagraph.eps, replace

sleep 1000

clear
infile intnr mage2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_stunting2_nonlinear_pspline_effect_of_mage2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 mage2, bcolor(gs13) || rarea pqu10 pqu90 mage2 , bcolor(gs10) || /*
 */ scatter pmean mage2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of mage2") xtitle("mage2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_stunting2_nonlinear_pspline_effect_of_mage2_statagraph.eps, replace

sleep 1000

clear
infile intnr cage2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_stunting2_nonlinear_pspline_effect_of_cage2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 cage2, bcolor(gs13) || rarea pqu10 pqu90 cage2 , bcolor(gs10) || /*
 */ scatter pmean cage2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of cage2") xtitle("cage2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_stunting2_nonlinear_pspline_effect_of_cage2_statagraph.eps, replace

sleep 1000

clear
infile intnr subregion pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_stunting2_spatial_MRF_effect_of_subregion.res
drop in 1
kdensity pmean
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_mu_REGRESSION_stunting2_spatial_MRF_effect_of_subregion_statagraph.eps, replace

sleep 1000

clear
infile intnr mbmi2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_wasting2_nonlinear_pspline_effect_of_mbmi2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 mbmi2, bcolor(gs13) || rarea pqu10 pqu90 mbmi2 , bcolor(gs10) || /*
 */ scatter pmean mbmi2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of mbmi2") xtitle("mbmi2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_wasting2_nonlinear_pspline_effect_of_mbmi2_statagraph.eps, replace

sleep 1000

clear
infile intnr mage2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_wasting2_nonlinear_pspline_effect_of_mage2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 mage2, bcolor(gs13) || rarea pqu10 pqu90 mage2 , bcolor(gs10) || /*
 */ scatter pmean mage2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of mage2") xtitle("mage2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_wasting2_nonlinear_pspline_effect_of_mage2_statagraph.eps, replace

sleep 1000

clear
infile intnr cage2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_wasting2_nonlinear_pspline_effect_of_cage2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 cage2, bcolor(gs13) || rarea pqu10 pqu90 cage2 , bcolor(gs10) || /*
 */ scatter pmean cage2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of cage2") xtitle("cage2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_wasting2_nonlinear_pspline_effect_of_cage2_statagraph.eps, replace

sleep 1000

clear
infile intnr subregion pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_wasting2_spatial_MRF_effect_of_subregion.res
drop in 1
kdensity pmean
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_wasting2_spatial_MRF_effect_of_subregion_statagraph.eps, replace

sleep 1000

clear
infile intnr mbmi2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_stunting2_nonlinear_pspline_effect_of_mbmi2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 mbmi2, bcolor(gs13) || rarea pqu10 pqu90 mbmi2 , bcolor(gs10) || /*
 */ scatter pmean mbmi2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of mbmi2") xtitle("mbmi2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_stunting2_nonlinear_pspline_effect_of_mbmi2_statagraph.eps, replace

sleep 1000

clear
infile intnr mage2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_stunting2_nonlinear_pspline_effect_of_mage2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 mage2, bcolor(gs13) || rarea pqu10 pqu90 mage2 , bcolor(gs10) || /*
 */ scatter pmean mage2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of mage2") xtitle("mage2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_stunting2_nonlinear_pspline_effect_of_mage2_statagraph.eps, replace

sleep 1000

clear
infile intnr cage2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_stunting2_nonlinear_pspline_effect_of_cage2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 cage2, bcolor(gs13) || rarea pqu10 pqu90 cage2 , bcolor(gs10) || /*
 */ scatter pmean cage2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of cage2") xtitle("cage2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_stunting2_nonlinear_pspline_effect_of_cage2_statagraph.eps, replace

sleep 1000

clear
infile intnr subregion pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_stunting2_spatial_MRF_effect_of_subregion.res
drop in 1
kdensity pmean
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_sigma_REGRESSION_stunting2_spatial_MRF_effect_of_subregion_statagraph.eps, replace

sleep 1000

clear
infile intnr mbmi2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_rho_REGRESSION_wasting2_nonlinear_pspline_effect_of_mbmi2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 mbmi2, bcolor(gs13) || rarea pqu10 pqu90 mbmi2 , bcolor(gs10) || /*
 */ scatter pmean mbmi2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of mbmi2") xtitle("mbmi2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_rho_REGRESSION_wasting2_nonlinear_pspline_effect_of_mbmi2_statagraph.eps, replace

sleep 1000

clear
infile intnr mage2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_rho_REGRESSION_wasting2_nonlinear_pspline_effect_of_mage2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 mage2, bcolor(gs13) || rarea pqu10 pqu90 mage2 , bcolor(gs10) || /*
 */ scatter pmean mage2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of mage2") xtitle("mage2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_rho_REGRESSION_wasting2_nonlinear_pspline_effect_of_mage2_statagraph.eps, replace

sleep 1000

clear
infile intnr cage2 pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_rho_REGRESSION_wasting2_nonlinear_pspline_effect_of_cage2.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 cage2, bcolor(gs13) || rarea pqu10 pqu90 cage2 , bcolor(gs10) || /*
 */ scatter pmean cage2, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of cage2") xtitle("cage2") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_rho_REGRESSION_wasting2_nonlinear_pspline_effect_of_cage2_statagraph.eps, replace

sleep 1000

clear
infile intnr subregion pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_rho_REGRESSION_wasting2_spatial_MRF_effect_of_subregion.res
drop in 1
kdensity pmean
graph export /home/mcarlan/VarSel/nigeria/results/bivnormal//bivn_MAIN_rho_REGRESSION_wasting2_spatial_MRF_effect_of_subregion_statagraph.eps, replace

sleep 1000

