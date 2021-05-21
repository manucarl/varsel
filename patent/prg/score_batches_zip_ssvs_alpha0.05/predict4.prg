% usefile ./prg/score_batches_zip_ssvs_alpha0.05/predict4.prg

logopen using /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.05/predict4.log

dataset d
d.infile using ./data//patentkg50_weighted_2.raw


delimiter=;

mcmcreg m4;


m4.outfile = /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.05/predict4/pi;
m4.hregress ncit = const + years(ssvs, gig, v1 = 5, v2 = 26.2575033798087, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 ncountrys(ssvs, gig, v1 = 5, v2 = 41.1532985596849, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 nclaimss(ssvs, gig, v1 = 5, v2 = 9.62367510691154, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 ustwin(ssvs, gig, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 opp(ssvs, gig, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 biopharm(ssvs, gig, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 patus(ssvs, gig, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 patgsgr(ssvs, gig, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ years(pspline, prior = ssvs, v1 = 5, v2 = 0.511880109122076,r = 0.000342239043010924,ssvsupdate=gibbs, centermethod=nullspace)+ 
ncountrys(pspline, prior = ssvs, v1 = 5, v2 = 0.51823046838236,r = 0.000340535716254245,ssvsupdate=gibbs, centermethod=nullspace)+ 
nclaimss(pspline, prior = ssvs, v1 = 5, v2 = 0.509178060973639,r = 0.000343733536850348,ssvsupdate=gibbs, centermethod=nullspace) weight w4, family=zip iterations=12000 burnin=2000 step=10 equationtype=pi using d; 


m4.outfile = /home/mcarlan/VarSel/patent/results/score_batches_zip_ssvs_alpha0.05/predict4/lambda;
m4.hregress ncit = const + years(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 26.2575033798087, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 ncountrys(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 41.1532985596849, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 nclaimss(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 9.62367510691154, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 ustwin(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 opp(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 biopharm(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 patus(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ 
 patgsgr(ssvs, gig,  prior=ssvs, v1 = 5, v2 = 206.623720063346, r = 0.000108329287060479,nocenter,ssvsupdate=gibbs)+ years(pspline, prior = ssvs, v1 = 5, v2 = 0.511880109122076,r = 0.000342239043010924,ssvsupdate=gibbs, centermethod=nullspace)+ 
ncountrys(pspline, prior = ssvs, v1 = 5, v2 = 0.51823046838236,r = 0.000340535716254245,ssvsupdate=gibbs, centermethod=nullspace)+ 
nclaimss(pspline, prior = ssvs, v1 = 5, v2 = 0.509178060973639,r = 0.000343733536850348,ssvsupdate=gibbs, centermethod=nullspace) weight w4,family=zip predict = light setseed=124 equationtype=lambda using d; 

m4.getsample;

m4.autocor;

drop m4;

drop d;

logclose;
