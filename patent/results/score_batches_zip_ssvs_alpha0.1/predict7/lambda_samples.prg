% usefile /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_samples.prg

dataset _d
graph _g

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_var_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_var_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_delta_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_delta_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_omega_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_omega_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_years_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_years_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_delta_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_delta_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_omega_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_omega_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_psi2_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_psi2_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_delta_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_delta_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_omega_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_omega_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_psi2_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_psi2_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_delta_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_delta_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_omega_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_omega_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_psi2_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_psi2_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_var_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_var_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_delta_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_delta_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_omega_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_omega_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_years_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_years_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_delta_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_delta_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_omega_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_omega_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_psi2_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_psi2_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_delta_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_delta_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_omega_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_omega_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_psi2_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_psi2_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_delta_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_delta_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_omega_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_omega_sample.ps using _d

_d.infile using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_psi2_sample.raw
_g.plotsample , outfile=/home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_psi2_sample.ps using _d

drop _d _g

