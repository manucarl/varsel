% usefile /home/mcarlan/VarSel/patent/prg/full_zip.prg

logopen using /home/mcarlan/VarSel/patent/results/full_zip/full.log

dataset d
d.infile using /home/mcarlan/VarSel/patent/data//patent.raw

delimiter=;

mcmcreg m1;


m1.outfile = /home/mcarlan/VarSel/patent/results/full_zip//pi;
m1.hregress ncit = const + opp+ biopharm +patus + patgsgr + 
 ncountrys(pspline, a=0.0001, b=0.0001, centermethod=meanf)+
 years(pspline, a=0.0001, b=0.0001, centermethod=meanf), family=zip iterations=12000 burnin=2000 step=10 equationtype=pi using d; 


m1.outfile = /home/mcarlan/VarSel/patent/results/full_zip//lambda;
m1.hregress ncit = const + opp+ biopharm +patus + patgsgr + 
 ncountrys(pspline, a=0.0001, b=0.0001, centermethod=meanf)+
 years(pspline, a=0.0001, b=0.0001, centermethod=meanf)+
 nclaimss(pspline, a=0.0001, b=0.0001, centermethod=meanf), family=zip predict = light setseed=123 equationtype=lambda using d; 

m1.getsample;

m1.autocor;

drop m1;

drop d;

logclose;

delimiter=return;