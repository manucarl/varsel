% usefile /home/mcarlan/VarSel/nigeria/bivn.prg

logopen using /home/mcarlan/VarSel/nigeria/results/bivnormal/bivn.log

dataset d
d.infile using /home/mcarlan/VarSel/nigeria/nigeria4.raw



map ma 
ma.infile using /home/mcarlan/VarSel/nigeria/nigeriamap.bnd

delimiter=;

mcmcreg m1;


m1.outfile = /home/mcarlan/VarSel/nigeria/results/bivnormal//fullmodel;
m1.hregress wasting2 = const +  
 csex+ 
 electricity+ 
 cbirthorder1+
 cbirthorder2+
 cbirthorder3+
 cbirthorder4+
 cbirthorder5+
 cbirthorder6+
 cbirthorder7+ 
 edupartner2+ 
 munemployed+ 
 mresidence+ 
 car+ 
 motorcycle+ 
 radio+ 
 television+ 
 ctwin+ 
 refrigerator+ 
 bicycle+ 
 mbmi2 + mage2 + cage2+
edupartner2(pspline,lambda=100, centermethod = nullspace)+ 
mbmi2(pspline,lambda=100, centermethod = nullspace)+ 
mage2(pspline,lambda=100, centermethod = nullspace)+ 
cage2(pspline,lambda=100, centermethod = nullspace)+ subregion(spatial, map=ma), family=bivnormal equationtype=rho iterations=12000 burnin=2000 step=10 setseed=1 using d; 

m1.hregress stunting2 = const + 
csex+ 
 electricity+ 
 cbirthorder1+
 cbirthorder2+
 cbirthorder3+
 cbirthorder4+
 cbirthorder5+
 cbirthorder6+
 cbirthorder7+ 
 edupartner2+ 
 munemployed+ 
 mresidence+ 
 car+ 
 motorcycle+ 
 radio+ 
 television+ 
 ctwin+ 
 refrigerator+ 
 bicycle+ 
 mbmi2 + mage2 + cage2+
edupartner2(pspline,lambda=100, centermethod = nullspace)+ 
mbmi2(pspline,lambda=100, centermethod = nullspace)+ 
mage2(pspline,lambda=100, centermethod = nullspace)+ 
cage2(pspline,lambda=100, centermethod = nullspace)+ subregion(spatial, map=ma), family=bivnormal equationtype=sigma setseed=1 using d; 

m1.hregress wasting2 = const + 
 csex+ 
 electricity+ 
 cbirthorder1+
 cbirthorder2+
 cbirthorder3+
 cbirthorder4+
 cbirthorder5+
 cbirthorder6+
 cbirthorder7+ 
 edupartner2+ 
 munemployed+ 
 mresidence+ 
 car+ 
 motorcycle+ 
 radio+ 
 television+ 
 ctwin+ 
 refrigerator+ 
 bicycle+ 
 mbmi2 + mage2 + cage2+
edupartner2(pspline,lambda=100, centermethod = nullspace)+ 
mbmi2(pspline,lambda=100, centermethod = nullspace)+ 
mage2(pspline,lambda=100, centermethod = nullspace)+ 
cage2(pspline,lambda=100, centermethod = nullspace)+ subregion(spatial, map=ma), family=bivnormal equationtype=sigma setseed=1 using d; 

m1.hregress stunting2 = const +  
csex+ 
 electricity+ 
 cbirthorder1+
 cbirthorder2+
 cbirthorder3+
 cbirthorder4+
 cbirthorder5+
 cbirthorder6+
 cbirthorder7+ 
 edupartner2+ 
 munemployed+ 
 mresidence+ 
 car+ 
 motorcycle+ 
 radio+ 
 television+ 
 ctwin+ 
 refrigerator+ 
 bicycle+ 
 mbmi2 + mage2 + cage2+
edupartner2(pspline,lambda=100, centermethod = nullspace)+ 
mbmi2(pspline,lambda=100, centermethod = nullspace)+ 
mage2(pspline,lambda=100, centermethod = nullspace)+ 
cage2(pspline,lambda=100, centermethod = nullspace)+ subregion(spatial, map=ma), family=bivnormal equationtype=mu setseed=1 using d; 

m1.hregress wasting2 = const +  
 csex+ 
 electricity+ 
 cbirthorder1+
 cbirthorder2+
 cbirthorder3+
 cbirthorder4+
 cbirthorder5+
 cbirthorder6+
 cbirthorder7+ 
 edupartner2+ 
 munemployed+ 
 mresidence+ 
 car+ 
 motorcycle+ 
 radio+ 
 television+ 
 ctwin+ 
 refrigerator+ 
 bicycle+ 
 mbmi2 + mage2 + cage2+
edupartner2(pspline,lambda=100, centermethod = nullspace)+ 
mbmi2(pspline,lambda=100, centermethod = nullspace)+ 
mage2(pspline,lambda=100, centermethod = nullspace)+ 
cage2(pspline,lambda=100, centermethod = nullspace)+ subregion(spatial, map=ma), family=bivnormal equationtype=mu setseed=1 predict=light using d; 


m1.getsample;

m1.autocor;

drop m1;

drop d;

logclose;

delimiter=return;