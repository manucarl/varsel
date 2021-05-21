% usefile ./prg/full_zip_ssvs_alpha0.05/full_zip_ssvs.prg

logopen using ./results/full_zip_ssvs_alpha0.05/full_zip.log

dataset d
d.infile using ./data/patent.raw



delimiter=;

mcmcreg m;


m.outfile = ./results/full_zip_ssvs_alpha0.05//pi;
m.hregress ncit = const + years(ssvs, gig, nocenter, v1 = 5, v2 = 26.2575033798087, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 ncountrys(ssvs, gig, nocenter, v1 = 5, v2 = 41.1532985596849, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 nclaimss(ssvs, gig, nocenter, v1 = 5, v2 = 9.62367510691154, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 ustwin(ssvs, gig, nocenter, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 opp(ssvs, gig, nocenter, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 biopharm(ssvs, gig, nocenter, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 patus(ssvs, gig, nocenter, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 patgsgr(ssvs, gig, nocenter, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,ssvsupdate=gibbs)+ years(pspline, prior = ssvs, v1 = 5, v2 = 0.511880109122076,r = 0.000342239043010924,ssvsupdate=gibbs, centermethod=nullspace)+ 
ncountrys(pspline, prior = ssvs, v1 = 5, v2 = 0.51823046838236,r = 0.000340535716254245,ssvsupdate=gibbs, centermethod=nullspace)+ 
nclaimss(pspline, prior = ssvs, v1 = 5, v2 = 0.509178060973639,r = 0.000343733536850348,ssvsupdate=gibbs, centermethod=nullspace), family=zip iterations=12000 burnin=2000 step=10 equationtype=pi using d; 


m.outfile = ./results/full_zip_ssvs_alpha0.05//lambda;
m.hregress ncit = const + years(ssvs, gig, nocenter, v1 = 5, v2 = 26.2575033798087, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 ncountrys(ssvs, gig, nocenter, v1 = 5, v2 = 41.1532985596849, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 nclaimss(ssvs, gig, nocenter, v1 = 5, v2 = 9.62367510691154, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 ustwin(ssvs, gig, nocenter, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 opp(ssvs, gig, nocenter, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 biopharm(ssvs, gig, nocenter, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 patus(ssvs, gig, nocenter, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,ssvsupdate=gibbs)+ 
 patgsgr(ssvs, gig, nocenter, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,ssvsupdate=gibbs)+ years(pspline, prior = ssvs, v1 = 5, v2 = 0.511880109122076,r = 0.000342239043010924,ssvsupdate=gibbs, centermethod=nullspace)+ 
ncountrys(pspline, prior = ssvs, v1 = 5, v2 = 0.51823046838236,r = 0.000340535716254245,ssvsupdate=gibbs, centermethod=nullspace)+ 
nclaimss(pspline, prior = ssvs, v1 = 5, v2 = 0.509178060973639,r = 0.000343733536850348,ssvsupdate=gibbs, centermethod=nullspace), family=zip predict = light setseed=123 equationtype=lambda using d; 

m.getsample;

m.autocor;

drop m;

drop d;

logclose;
