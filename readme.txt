---------------------------------------------------------------------------------------------------------------------------
This script gives a guideline to estimate the models of the illustration on childhood undernutrition, Section 5.2.2
of the paper "Bayesian Effect Selection in Structured Additive Distributional Regression" by Nadja Klein et al.

Authors of this script: Nadja Klein, n.klein@mbs.edu and Manuel Carlan, mcarlan@uni-goettingen.de
---------------------------------------------------------------------------------------------------------------------------

FROM HERE TO BE ADAPTED!!

1. Specify an appropriate folder with YOURPATH and copy the three subfolders data, prg, results and Rfiles.
	
2.  The folder data contains the required geographical information, stored in data set nigeriamap.bnd.
    The data can be extract from www.measuredhs.com after registration and running Rfiles/preprog_ng/preproc_new_ng.R.
    In the paper, the data set nigeria4.raw was used although results should be robust for the original data set.
	
3. The folder results is for storing the results, once the estimation has been performed.

(4a.) Rfiles/bivnormal_ssvs.R contains an implementation of the hyperparameter elicitation procedure.
      In this file you can specify the covariates for which effects hyperparameters should be elicitated. Furthermore,
      the prior probability alpha and the threshold c can be specified to the researchers' demand.

4. prg/bivn_ssvs_alpha01_c01.prg contains the BayesX script that estimates the model with the NBPSS prior (included hyperparameters
   where elicitated on basis of the prior probability alpha=0.1 and threshold c=0.1).
   prg/bivn.prg contains the BayesX script that estimates the model without the NBPSS prior
    To estimate a model, make first sure that all occurences of YOURPATH in prg/analysis.prg have been replaced with your folder.
    You then have to install a BayesX command line version >= 3.0.2 from www.bayesx.org and start the software.
	Copy the first line of analysis.prg, starting with usefile (without "%"!!) to the command line and press enter.
	In case all previous steps have been followed correclty, BayesX starts estimating the models.