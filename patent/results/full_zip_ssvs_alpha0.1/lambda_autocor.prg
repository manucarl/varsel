% usefile ./results/full_zip_ssvs_alpha0.1//lambda_autocor.prg

dataset _d
graph _g

_d.infile using ./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_LinearEffects_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_LinearEffects_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_var_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_LinearEffects_ssvs_var_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_years_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_years_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//pi_MAIN_pi_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_var_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_LinearEffects_ssvs_var_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_years_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_years_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_years_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_ncountrys_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_ncountrys_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_nonlinear_pspline_effect_of_nclaimss_autocor.ps using _d

_d.infile using ./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_autocor.raw
_g.plotautocor , outfile=./results/full_zip_ssvs_alpha0.1//lambda_MAIN_lambda_REGRESSION_ncit_variance_of_nonlinear_pspline_effect_of_nclaimss_autocor.ps using _d

drop _d _g

