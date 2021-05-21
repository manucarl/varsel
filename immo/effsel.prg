% usefile c:\arbeit\paper\VarSel\immo2\effsel.prg

delimiter =;

logopen using c:\arbeit\paper\VarSel\immo2\results\effsel.log;

dataset d2;
d2.infile using c:\arbeit\paper\VarSel\immo2\daten\kreis1_neu.txt;
d2.generate kgs4 =kgs05a;
d2.generate kgs4a =kgs05a;
d2.generate kgs5 =kgs05a;


dataset d;
d.infile using c:\arbeit\paper\VarSel\immo2\daten\subsample1a_aufb_neu.raw;
d.generate kgs4 =kgs05a;
d.generate kgs4a =kgs05a;
d.generate kgs5 =kgs05a;


map m;
m.infile using c:\arbeit\paper\VarSel\immo2\daten\map4.bnd;

mcmcreg b;

b.outfile =c:\arbeit\paper\VarSel\immo2\results\effsel_sigma2_level2;
b.hregress kgs4 = baujahr_s(ssvs, gig, v1=5, v2=4.522987, r=0.000450258)+
                  baujahr_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.1271951, r=0.002262521, ssvsupdate=gibbs) +
                  rating_s(ssvs, gig, v1=5, v2=6.004576, r=0.000450258)+
                  rating_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.1271967, r=0.002262497, ssvsupdate=gibbs) +
                  kgs4a(spatial,map=m,prior=ssvs, v1=5, v2=0.3779224, r=0.004379613, ssvsupdate=gibbs), 
                  family=gaussian_re equationtype=sigma2 iterations=12000 burnin=1000 step=10 hlevel=2 using d2;

b.outfile =c:\arbeit\paper\VarSel\immo2\results\effsel_sigma2_level1;
b.hregress pqm_s = const +  
                   wfl_s(ssvs, gig, v1=5, v2=4.882433, r=0.000450258) +
                   wfl_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.1272266, r=0.002262134, ssvsupdate=gibbs) +
                   grstfl_s(ssvs, gig, v1=5, v2=2.288634, r=0.000450258)+
                   grstfl_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.127195, r=0.002262537, ssvsupdate=gibbs) +
                   baujahr_s(ssvs, gig, v1=5, v2=1.721913, r=0.000450258)+
                   baujahr_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.1271957, r=0.002262518, ssvsupdate=gibbs) +
                   rating_s(ssvs, gig, v1=5, v2=1.047535, r=0.000450258)+
                   rating_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.1284191, r=0.002247759, ssvsupdate=gibbs) +
                   kgs4(hrandom),
                   saveestimation setseed=12345 family=normal equationtype=sigma2  using d;

b.outfile =c:\arbeit\paper\VarSel\immo2\results\effsel_mu_level2;
b.hregress kgs5 = baujahr_s(ssvs, gig, v1=5, v2=4.522987, r=0.000450258)+
                  baujahr_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.1271951, r=0.002262521, ssvsupdate=gibbs) +
                  rating_s(ssvs, gig, v1=5, v2=6.004576, r=0.000450258)+
                  rating_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.1271967, r=0.002262497, ssvsupdate=gibbs) +
                  kgs05a(spatial,map=m,prior=ssvs, v1=5, v2=0.3779224, r=0.004379613, ssvsupdate=gibbs), 
                  family=gaussian_re equationtype=mu  hlevel=2 using d2;

b.outfile =c:\arbeit\paper\VarSel\immo2\results\effsel_mu_level1;
b.hregress pqm_s = const + 
                   wfl_s(ssvs, gig, v1=5, v2=4.882433, r=0.000450258) +
                   wfl_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.1272266, r=0.002262134, ssvsupdate=gibbs) +
                   grstfl_s(ssvs, gig, v1=5, v2=2.288634, r=0.000450258)+
                   grstfl_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.127195, r=0.002262537, ssvsupdate=gibbs) +
                   baujahr_s(ssvs, gig, v1=5, v2=1.721913, r=0.000450258)+
                   baujahr_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.1271957, r=0.002262518, ssvsupdate=gibbs) +
                   rating_s(ssvs, gig, v1=5, v2=1.047535, r=0.000450258)+
                   rating_s(pspline, centermethod=nullspace, prior=ssvs, v1=5, v2=0.1284191, r=0.002247759, ssvsupdate=gibbs) +
                   kgs5(hrandom) ,
                   saveestimation setseed=1 family=normal equationtype=mu iterations=12000 burnin=2000 step=10 predict=light WAICoff using d;

b.getsample;

drop d d2 m b;

logclose;

delimiter=return;

