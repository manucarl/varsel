% usefile ./results/score_batches_zip/predict7/lambda_autocor.prg

dataset _d
graph _g

_d.infile using ./results/score_batches_zip/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/pi_MAIN_pi_REGRESSION_ncit_LinearEffects_autocor.ps using _d

_d.infile using ./results/score_batches_zip/predict7/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_autocor.ps using _d

_d.infile using ./results/score_batches_zip/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_autocor.ps using _d

_d.infile using ./results/score_batches_zip/predict7/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_years_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_years_autocor.ps using _d

_d.infile using ./results/score_batches_zip/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_autocor.ps using _d

_d.infile using ./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_autocor.ps using _d

_d.infile using ./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_autocor.ps using _d

_d.infile using ./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_autocor.ps using _d

_d.infile using ./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_years_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_years_autocor.ps using _d

_d.infile using ./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_autocor.ps using _d

_d.infile using ./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_autocor.ps using _d

_d.infile using ./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_autocor.raw
_g.plotautocor , outfile=./results/score_batches_zip/predict7/lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_autocor.ps using _d

drop _d _g

