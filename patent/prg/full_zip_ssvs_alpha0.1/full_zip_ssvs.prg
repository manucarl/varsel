% usefile ./prg/full_zip_ssvs_alpha0.1/full_zip_ssvs.prg

logopen using ./results/full_zip_ssvs_alpha0.1/full_zip.log

dataset d
d.infile using ./data/patent.raw



delimiter=;

mcmcreg m;


m.outfile = ./results/full_zip_ssvs_alpha0.1//pi;
m.hregress ncit = const + years(ssvs, gig, nocenter, v1 = 5, v2 = 5.11267637381253, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 ncountrys(ssvs, gig, nocenter, v1 = 5, v2 = 8.01308084044079, r = 0.000427807773783825,ssvsupdate=gibbs)+ 
 nclaimss(ssvs, gig, nocenter, v1 = 5, v2 = 1.87385432790956, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 ustwin(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 opp(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 biopharm(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 patus(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 patgsgr(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ years(pspline, prior = ssvs, v1 = 5, v2 = 0.13191806519867,r = 0.00236823278186377,ssvsupdate=gibbs, centermethod=nullspace)+ 
ncountrys(pspline, prior = ssvs, v1 = 5, v2 = 0.133496773439331,r = 0.00235718016863298,ssvsupdate=gibbs, centermethod=nullspace)+ 
nclaimss(pspline, prior = ssvs, v1 = 5, v2 = 0.128951185590821,r = 0.00241720850083264,ssvsupdate=gibbs, centermethod=nullspace), family=zip iterations=12000 burnin=2000 step=10 equationtype=pi using d; 


m.outfile = ./results/full_zip_ssvs_alpha0.1//lambda;
m.hregress ncit = const + years(ssvs, gig, nocenter, v1 = 5, v2 = 5.11267637381253, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 ncountrys(ssvs, gig, nocenter, v1 = 5, v2 = 8.01308084044079, r = 0.000427807773783825,ssvsupdate=gibbs)+ 
 nclaimss(ssvs, gig, nocenter, v1 = 5, v2 = 1.87385432790956, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 ustwin(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 opp(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 biopharm(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 patus(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 patgsgr(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ years(pspline, prior = ssvs, v1 = 5, v2 = 0.13191806519867,r = 0.00236823278186377,ssvsupdate=gibbs, centermethod=nullspace)+ 
ncountrys(pspline, prior = ssvs, v1 = 5, v2 = 0.133496773439331,r = 0.00235718016863298,ssvsupdate=gibbs, centermethod=nullspace)+ 
nclaimss(pspline, prior = ssvs, v1 = 5, v2 = 0.128951185590821,r = 0.00241720850083264,ssvsupdate=gibbs, centermethod=nullspace), family=zip predict = light setseed=123 equationtype=lambda using d; 

m.getsample;

m.autocor;

drop m;

drop d;

logclose;
