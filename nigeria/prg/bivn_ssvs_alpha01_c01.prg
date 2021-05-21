% usefile /home/mcarlan/VarSel/nigeria/bivn_ssvs.prg

logopen using /home/mcarlan/VarSel/nigeria/results/bivnormal/bivn_ssvs.log

dataset d
d.infile using /home/mcarlan/VarSel/nigeria/nigeria4.raw

map ma 
ma.infile using /home/mcarlan/VarSel/nigeria/nigeriamap.bnd

delimiter=;

mcmcreg m1;


m1.outfile = /home/mcarlan/VarSel/nigeria/results/bivnormal//effsel;
m1.hregress wasting2 = const + mbmi2(ssvs, gig, nocenter, v1 = 5, v2 = 2.27663864725236, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 mage2(ssvs, gig, nocenter, v1 = 5, v2 = 3.71465754920114, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 cage2(ssvs, gig, nocenter, v1 = 5, v2 = 13.0149573534623, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 edupartner2(ssvs, gig, nocenter, v1 = 5, v2 = 7.60978002371624, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 csex(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 electricity(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 cbirthorder1(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 cbirthorder2(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 cbirthorder3(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 cbirthorder4(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 cbirthorder5(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 cbirthorder6(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 cbirthorder7(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 munemployed(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 mresidence(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 car(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 motorcycle(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 radio(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 television(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 ctwin(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 refrigerator(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ 
 bicycle(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824,ssvsupdate=gibbs)+ mbmi2(pspline, prior = ssvs, v1 = 5, v2 = 0.128484087968183,r = 0.00242408227377624,ssvsupdate=gibbs, centermethod=nullspace)+ 
mage2(pspline, prior = ssvs, v1 = 5, v2 = 0.129489581046799,r = 0.00240658196579846,ssvsupdate=gibbs, centermethod=nullspace)+ 
cage2(pspline, prior = ssvs, v1 = 5, v2 = 0.128784434897011,r = 0.00241832268693273,ssvsupdate=gibbs, centermethod=nullspace)+ 
edupartner2(pspline, prior = ssvs, v1 = 5, v2 = 0.132033063653206,r = 0.00238319729006314,ssvsupdate=gibbs, centermethod=nullspace)+ subregion(spatial, map=ma,  prior = ssvs, v1 =5, v2 = 1.25383449403636,r = 0.00422130230664418,ssvsupdate=gibbs), family=bivnormal iterations=12000 burnin=2000 step=10 equationtype=rho setseed=1 using d; 

m1.hregress stunting2 = const + mbmi2(ssvs, gig, nocenter, v1 = 5, v2 = 2.27663864725236, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 mage2(ssvs, gig, nocenter, v1 = 5, v2 = 3.71465754920114, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cage2(ssvs, gig, nocenter, v1 = 5, v2 = 13.0149573534623, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 edupartner2(ssvs, gig, nocenter, v1 = 5, v2 = 7.60978002371624, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 csex(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 electricity(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder1(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder2(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder3(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder4(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder5(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder6(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder7(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 munemployed(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 mresidence(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 car(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 motorcycle(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 radio(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 television(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 ctwin(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 refrigerator(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 bicycle(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ mbmi2(pspline, prior = ssvs, v1 = 5, v2 = 0.128484087968183,r = 0.00242408227377624,ssvsupdate=gibbs, centermethod=nullspace)+ 
mage2(pspline, prior = ssvs, v1 = 5, v2 = 0.129489581046799,r = 0.00240658196579846,ssvsupdate=gibbs, centermethod=nullspace)+ 
cage2(pspline, prior = ssvs, v1 = 5, v2 = 0.128784434897011,r = 0.00241832268693273,ssvsupdate=gibbs, centermethod=nullspace)+ 
edupartner2(pspline, prior = ssvs, v1 = 5, v2 = 0.132033063653206,r = 0.00238319729006314,ssvsupdate=gibbs, centermethod=nullspace)+ subregion(spatial, map=ma,  prior = ssvs, v1 =5, v2 = 1.25383449403636,r = 0.00422130230664418,ssvsupdate=gibbs), family=bivnormal iterations=12000 burnin=2000 step=10 equationtype=sigma setseed=1 using d; 

m1.hregress wasting2 = const + mbmi2(ssvs, gig, nocenter, v1 = 5, v2 = 2.27663864725236, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 mage2(ssvs, gig, nocenter, v1 = 5, v2 = 3.71465754920114, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cage2(ssvs, gig, nocenter, v1 = 5, v2 = 13.0149573534623, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 edupartner2(ssvs, gig, nocenter, v1 = 5, v2 = 7.60978002371624, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 csex(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 electricity(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder1(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder2(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder3(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder4(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder5(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder6(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder7(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 munemployed(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 mresidence(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 car(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 motorcycle(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 radio(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 television(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 ctwin(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 refrigerator(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 bicycle(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ mbmi2(pspline, prior = ssvs, v1 = 5, v2 = 0.128484087968183,r = 0.00242408227377624,ssvsupdate=gibbs, centermethod=nullspace)+ 
mage2(pspline, prior = ssvs, v1 = 5, v2 = 0.129489581046799,r = 0.00240658196579846,ssvsupdate=gibbs, centermethod=nullspace)+ 
cage2(pspline, prior = ssvs, v1 = 5, v2 = 0.128784434897011,r = 0.00241832268693273,ssvsupdate=gibbs, centermethod=nullspace)+ 
edupartner2(pspline, prior = ssvs, v1 = 5, v2 = 0.132033063653206,r = 0.00238319729006314,ssvsupdate=gibbs, centermethod=nullspace)+ subregion(spatial, map=ma,  prior = ssvs, v1 =5, v2 = 1.25383449403636,r = 0.00422130230664418,ssvsupdate=gibbs), family=bivnormal iterations=12000 burnin=2000 step=10 equationtype=sigma setseed=1 using d; 

m1.hregress stunting2 = const + mbmi2(ssvs, gig, nocenter, v1 = 5, v2 = 2.27663864725236, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 mage2(ssvs, gig, nocenter, v1 = 5, v2 = 3.71465754920114, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cage2(ssvs, gig, nocenter, v1 = 5, v2 = 13.0149573534623, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 edupartner2(ssvs, gig, nocenter, v1 = 5, v2 = 7.60978002371624, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 csex(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 electricity(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder1(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder2(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder3(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder4(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder5(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder6(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder7(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 munemployed(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 mresidence(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 car(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 motorcycle(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 radio(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 television(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 ctwin(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 refrigerator(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 bicycle(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ mbmi2(pspline, prior = ssvs, v1 = 5, v2 = 0.128484087968183,r = 0.00242408227377624,ssvsupdate=gibbs, centermethod=nullspace)+ 
mage2(pspline, prior = ssvs, v1 = 5, v2 = 0.129489581046799,r = 0.00240658196579846,ssvsupdate=gibbs, centermethod=nullspace)+ 
cage2(pspline, prior = ssvs, v1 = 5, v2 = 0.128784434897011,r = 0.00241832268693273,ssvsupdate=gibbs, centermethod=nullspace)+ 
edupartner2(pspline, prior = ssvs, v1 = 5, v2 = 0.132033063653206,r = 0.00238319729006314,ssvsupdate=gibbs, centermethod=nullspace)+ subregion(spatial, map=ma,  prior = ssvs, v1 =5, v2 = 1.25383449403636,r = 0.00422130230664418,ssvsupdate=gibbs), family=bivnormal iterations=12000 burnin=2000 step=10 equationtype=mu setseed=1 using d; 

m1.hregress wasting2 = const + mbmi2(ssvs, gig, nocenter, v1 = 5, v2 = 2.27663864725236, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 mage2(ssvs, gig, nocenter, v1 = 5, v2 = 3.71465754920114, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cage2(ssvs, gig, nocenter, v1 = 5, v2 = 13.0149573534623, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 edupartner2(ssvs, gig, nocenter, v1 = 5, v2 = 7.60978002371624, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 csex(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 electricity(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder1(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder2(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder3(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder4(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder5(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder6(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 cbirthorder7(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 munemployed(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 mresidence(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 car(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 motorcycle(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 radio(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 television(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 ctwin(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 refrigerator(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ 
 bicycle(ssvs, gig, nocenter, v1 = 5, v2 = 40.2323174658512, r = 0.000427807773783824, ssvsupdate=gibbs)+ mbmi2(pspline, prior = ssvs, v1 = 5, v2 = 0.128484087968183,r = 0.00242408227377624,ssvsupdate=gibbs, centermethod=nullspace)+ 
mage2(pspline, prior = ssvs, v1 = 5, v2 = 0.129489581046799,r = 0.00240658196579846,ssvsupdate=gibbs, centermethod=nullspace)+ 
cage2(pspline, prior = ssvs, v1 = 5, v2 = 0.128784434897011,r = 0.00241832268693273,ssvsupdate=gibbs, centermethod=nullspace)+ 
edupartner2(pspline, prior = ssvs, v1 = 5, v2 = 0.132033063653206,r = 0.00238319729006314,ssvsupdate=gibbs, centermethod=nullspace)+ subregion(spatial, map=ma,  prior = ssvs, v1 =5, v2 = 1.25383449403636,r = 0.00422130230664418,ssvsupdate=gibbs), family=bivnormal iterations=12000 burnin=2000 step=10 equationtype=mu  setseed=1 predict=light using d; 


m1.getsample;

m1.autocor;

drop m1;

drop d;

logclose;
