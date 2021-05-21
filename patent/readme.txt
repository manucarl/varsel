---------------------------------------------------------------------------------------------------------------------------
This script gives a guideline to estimate the models of the illustration on patent citations, Section 5.2.2
of the paper "Bayesian Effect Selection in Structured Additive Distributional Regression" by Nadja Klein et al.

Author(s) of this script: Manuel Carlan, mcarlan@uni-goettingen.de
---------------------------------------------------------------------------------------------------------------------------

FROM HERE TO BE ADAPTED!!

1. Specify an appropriate folder with YOURPATH and copy the three subfolders data, prg, results and Rfiles.
		
2. The folder results is for storing the results, once the estimation has been performed.

Scripts for Estimation (all R scripts start BayesX automatically, if directory is specified correctly):
3. - Rfiles/score_batches_zip_ssvs.R estimates ten batches for obtaining the scores with hyperparameter elicitation on basis of the NBPSS prior
   - Rfiles/full_zip_ssvs.R estimates a full model with all available covariates in the predictor with hyperparameter elicitaiton on basis of the
     NBPSS prior (used for calculating DIC and WAIC)
   - Rfiles/scores_batches_zip.R estimates ten batches for obtaining the scores as specified in Klein et. al (2015) - called ZIP_DIC in the paper
   - prg/full_zip.prg contains the BayesX script needed for estimating the ZIP_DIC model in the paper (used for calculating DIC and WAIC)
Auxiliary: Rfiles/hyper.R contains function that performs elicitation

4. .RData in the main folder contain elicitated hyperparameters used in the paper

5. prg/ contains all generated .prgs that were used by BayesX
   
6. compute_table.R calculates scores on basis of the results stored in folder results/. Uses Rfiles/scores_d.R. Produces the table in the supplement.