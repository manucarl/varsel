clear
infile intnr years pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_years.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 years, bcolor(gs13) || rarea pqu10 pqu90 years , bcolor(gs10) || /*
 */ scatter pmean years, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of years") xtitle("years") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_years_statagraph.eps, replace

sleep 1000

clear
infile intnr ncountrys pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 ncountrys, bcolor(gs13) || rarea pqu10 pqu90 ncountrys , bcolor(gs10) || /*
 */ scatter pmean ncountrys, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of ncountrys") xtitle("ncountrys") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_statagraph.eps, replace

sleep 1000

clear
infile intnr nclaimss pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 nclaimss, bcolor(gs13) || rarea pqu10 pqu90 nclaimss , bcolor(gs10) || /*
 */ scatter pmean nclaimss, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of nclaimss") xtitle("nclaimss") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_statagraph.eps, replace

sleep 1000

clear
infile intnr years pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_years.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 years, bcolor(gs13) || rarea pqu10 pqu90 years , bcolor(gs10) || /*
 */ scatter pmean years, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of years") xtitle("years") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_years_statagraph.eps, replace

sleep 1000

clear
infile intnr ncountrys pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 ncountrys, bcolor(gs13) || rarea pqu10 pqu90 ncountrys , bcolor(gs10) || /*
 */ scatter pmean ncountrys, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of ncountrys") xtitle("ncountrys") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_statagraph.eps, replace

sleep 1000

clear
infile intnr nclaimss pmean pstd pqu2p5 pqu10 pmed pqu90 pqu97p5 pcat95 pcat80 sim_pqu2p5 sim_pqu10 sim_pqu90 sim_pqu97p5 sim_pcat95 sim_pcat80 using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss.res
drop in 1
graph twoway rarea pqu2p5 pqu97p5 nclaimss, bcolor(gs13) || rarea pqu10 pqu90 nclaimss , bcolor(gs10) || /*
 */ scatter pmean nclaimss, c(l) m(i) clpattern(l) clcolor(gs0) /* 
 */ ytitle("Effect of nclaimss") xtitle("nclaimss") xlab(,grid) ylab(,grid) legend(off)
graph export /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict3/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_statagraph.eps, replace

sleep 1000

