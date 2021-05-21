% usefile ./prg/score_batches_zip_ssvs_alpha0.1/predict9.prg

logopen using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict9.log

dataset d
d.infile using ./data//patentkg50_weighted_2.raw


delimiter=;

mcmcreg m9;


m9.outfile = /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict9/pi;
m9.hregress ncit = const + years(ssvs, gig, v1 = 5, v2 = 5.11267637381253, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 ncountrys(ssvs, gig, v1 = 5, v2 = 8.01308084044079, r = 0.000427807773783825,nocenter,ssvsupdate=gibbs)+ 
 nclaimss(ssvs, gig, v1 = 5, v2 = 1.87385432790956, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 ustwin(ssvs, gig, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 opp(ssvs, gig, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 biopharm(ssvs, gig, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 patus(ssvs, gig, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 patgsgr(ssvs, gig, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ years(pspline, prior = ssvs, v1 = 5, v2 = 0.13191806519867,r = 0.00236823278186377,ssvsupdate=gibbs, centermethod=nullspace)+ 
ncountrys(pspline, prior = ssvs, v1 = 5, v2 = 0.133496773439331,r = 0.00235718016863298,ssvsupdate=gibbs, centermethod=nullspace)+ 
nclaimss(pspline, prior = ssvs, v1 = 5, v2 = 0.128951185590821,r = 0.00241720850083264,ssvsupdate=gibbs, centermethod=nullspace) weight w9, family=zip iterations=12000 burnin=2000 step=10 equationtype=pi using d; 


m9.outfile = /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.1/predict9/lambda;
m9.hregress ncit = const + years(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 5.11267637381253, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 ncountrys(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 8.01308084044079, r = 0.000427807773783825,nocenter,ssvsupdate=gibbs)+ 
 nclaimss(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 1.87385432790956, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 ustwin(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 opp(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 biopharm(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 patus(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ 
 patgsgr(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,nocenter,ssvsupdate=gibbs)+ years(pspline, prior = ssvs, v1 = 5, v2 = 0.13191806519867,r = 0.00236823278186377,ssvsupdate=gibbs, centermethod=nullspace)+ 
ncountrys(pspline, prior = ssvs, v1 = 5, v2 = 0.133496773439331,r = 0.00235718016863298,ssvsupdate=gibbs, centermethod=nullspace)+ 
nclaimss(pspline, prior = ssvs, v1 = 5, v2 = 0.128951185590821,r = 0.00241720850083264,ssvsupdate=gibbs, centermethod=nullspace) weight w9,family=zip predict = light setseed=129 equationtype=lambda using d; 

m9.getsample;

m9.autocor;

drop m9;

drop d;

logclose;
