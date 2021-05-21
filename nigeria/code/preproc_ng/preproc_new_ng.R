#===================================================
#Malnutrition. get data.
#===================================================
# load some required packages & change working directory

library("foreign")
library("car")

# obtain the stata data set IAKR42FL.dta from measuredhs.com
# (this is the children's recode for 2005/06 in India)
# store it in the path from above and read the data
# (takes sime time due to the size of the data set)

nigeriaraw <- read.dta("NGKR6AFL.DTA")

# define the spatial variable (based on a manual recode provided in
# districtcoding.R

source("districtcoding_new_ng.R", echo=TRUE)

# reextract relevant variable and recode

vars <- character(0)
nams <- character(0)

# response related variables:
# hw2      "Weight in kilograms (1 decimal)"
# hw3      "Height in centimeters (1 decimal)"
# hw5      "Ht/A Standard deviations (according to WHO)" = Stunting
# hw11     "Wt/Ht Standard deviations (according to WHO)" = Wasting
# hw8      "Wt/A Standard deviations (according to WHO)" = Underweight

vars <- c(vars, "v191", "v102")
nams <- c(nams, "wealth", "urban")

nigeriaraw$hw2 <- nigeriaraw$hw2/10
nigeriaraw$hw3 <- nigeriaraw$hw3/10
nigeriaraw$cbmi <- nigeriaraw$hw2/((nigeriaraw$hw3/100)^2)

vars <- c(vars, c("hw2", "hw3", "hw5", "hw11", "hw8", "cbmi"))
nams <- c(nams, c("cweight", "cheight", "stunting", "wasting", "underweight", "cbmi"))

# v008     "Date of interview (CMC)"
# b3       "Date of birth (CMC)"
# m5       "Months of breastfeeding"
# b4       "Sex of child"
# bord     "Birth order number"
# b0       "Child is twin"

nigeriaraw$cage <- nigeriaraw$v008 - nigeriaraw$b3
nigeriaraw$ctwin <- recode(nigeriaraw$b0, "c('1st of multiple','2nd of multiple','3rd of multiple','4th of multiple','5th of multiple')='twin'")

vars <- c(vars, c("cage", "m5", "b4", "ctwin", "bord"))
nams <- c(nams, c("cage", "breastfeeding", "csex", "ctwin", "cbirthorder"))

# v445     "Body mass index for respondent"
# v437     "Respondent's weight (kilos-1d)"
# v438     "Respondent's height (cms-1d)"
# b3       "Date of birth (CMC)"
# v011     "Date of birth (CMC)"
# v133     "Education in single years"
# v715     "Partner's education-single years"
# v717     "Respondent's occupation"
# v130     "Religion"
# v025     "Type of place of residence"
# v206     "Sons who have died"
# v207     "Daughters who have died"

nigeriaraw$v445 <- nigeriaraw$v445/100
nigeriaraw$v437 <- nigeriaraw$v437/10
nigeriaraw$v438 <- nigeriaraw$v438/10
nigeriaraw$mage <- round((nigeriaraw$b3-nigeriaraw$v011)/12, 0)
nigeriaraw$munemployed <- as.numeric(nigeriaraw$v717)
nigeriaraw$munemployed[nigeriaraw$munemployed>0] <- 1
nigeriaraw$munemployed <- factor(nigeriaraw$munemployed, labels=c("unemployed","employed")) # hier
nigeriaraw$mreligion <- recode(nigeriaraw$v130, "c('buddhist/neo-buddhist','jain','jewish','parsi/zoroastrian','no religion','donyi polo')='other'")
nigeriaraw$deadchildren <- nigeriaraw$v206 + nigeriaraw$v207

vars <- c(vars, c("v445", "v437", "v438", "mage", "v133", "v715", "munemployed", "mreligion", "v025", "deadchildren"))
nams <- c(nams, c("mbmi", "mweight", "mheight", "mage", "medu", "edupartner", "munemployed", "mreligion", "mresidence", "deadchildren"))

# ?        "Wealth index"
# v119     "Has electricity"
# v120     "Has radio"
# v121     "Has television"
# v122     "Has refrigerator"
# v123     "Has bicycle"
# v124     "Has motorcycle/scooter"
# v125     "Has car"

vars <- c(vars, c("v119", "v120", "v121", "v122", "v123", "v124", "v125"))
nams <- c(nams, c("electricity", "radio", "television", "refrigerator", "bicycle", "motorcycle", "car"))

vars <- c(vars, "region", "subregion")
nams <- c(nams, "region", "subregion")

nigeria <- nigeriaraw[,vars] # hier
names(nigeria) <- nams

n <- nrow(nigeria)

nigeria$poorest <- rep(0, n)
nigeria$poorer <- rep(0, n)
nigeria$richer <- rep(0, n)
nigeria$richest <- rep(0, n)

nigeria$poorest[nigeriaraw$v190 == "Poorest"] <- 1
nigeria$poorer[nigeriaraw$v190 == "Poorer"] <- 1
nigeria$richer[nigeriaraw$v190 == "Richer"] <- 1
nigeria$richest[nigeriaraw$v190 == "Richest"] <- 1

# rm(nigeriaraw)

# plausibility checks

hist(nigeria$cweight, xlim = c(0, 50), breaks = 2000)
nigeria$cweight[nigeria$cweight>25] <- NA
hist(nigeria$cheight, xlim = c(0, 200), breaks = 2000)
nigeria$cheight[nigeria$cheight>150] <- NA
hist(nigeria$stunting)
nigeria$stunting[nigeria$stunting>2000] <- NA
hist(nigeria$wasting)
nigeria$wasting[nigeria$wasting>2000] <- NA
hist(nigeria$underweight)
nigeria$underweight[nigeria$underweight>2000] <- NA

hist(nigeria$cbmi, xlim = c(0, 50), breaks= 200)
nigeria$cbmi[nigeria$cbmi>40] <- NA #hier geaendert
nigeria$cbmi[nigeria$cbmi<5] <- NA
plot(nigeria$cbmi, nigeria$stunting)

hist(nigeria$cage)
plot(nigeria$cage, nigeria$stunting)

table(nigeria$breastfeeding)
#    0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17 
#  253   521   484   529   531   505   534   522   513   519   498   406   524   539   458   415   346   245 
#   18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35 
#  240   202   187   159    94    72    72    52    61    31    24    20    19    18    33    16    21    19 
#   36    37    38    39    40    41    42    43    44    45    46    47    48    49    50    51    52    53 
#   13    11     5     4     7     2     4     2     3     6     7     2     3     2     5     3     4     3 
#   54    55    56    57    58    59    93    94    99 
#    1     5     2     2     1     3 20304   818   578
plot(nigeria$breastfeeding, nigeria$stunting)
# breastfeeding mostly unavailable
#sum(nigeria$breastfeeding > nigeria$cage, na.rm=T)  # 1191 -> 2753
#nigeria$breastfeeding[nigeria$breastfeeding > nigeria$cage] <- NA

table(nigeria$csex)
#  male female
# 15965  15517
plot(nigeria$csex, nigeria$stunting)

table(nigeria$ctwin)
# single birth    twin
#        30384    1098
plot(nigeria$ctwin, nigeria$stunting)

table(nigeria$cbirthorder)
#   1    2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18
#6109 5384 4690 4061 3319 2591 1930 1375  908  549  310  177   46   22    6    2    2    1 
nigeria$cbirthorder[nigeria$cbirthorder>8] <- 8 # 5 -> 8
nigeria$cbirthorder <- factor(nigeria$cbirthorder)
plot(nigeria$cbirthorder, nigeria$stunting)

hist(nigeria$mbmi)
nigeria$mbmi[nigeria$mbmi>40] <- NA
plot(nigeria$mbmi, nigeria$stunting)

hist(nigeria$mweight, xlim = c(0, 200), breaks = 200)
nigeria$mweight[nigeria$mweight>120] <- NA
nigeria$mweight[nigeria$mweight<20] <- NA
plot(nigeria$mweight, nigeria$stunting)

hist(nigeria$mheight, xlim = c(100, 200), breaks = 200)
nigeria$mheight[nigeria$mheight>185] <- NA
nigeria$mheight[nigeria$mheight<123] <- NA
plot(nigeria$mheight, nigeria$stunting)

hist(nigeria$mage)
plot(nigeria$mage, nigeria$stunting)

hist(nigeria$medu)
nigeria$medu[nigeria$medu > 25] <- NA
plot(nigeria$medu, nigeria$stunting)

hist(nigeria$edupartner)
nigeria$edupartner[nigeria$edupartner>80] <- NA
plot(nigeria$edupartner, nigeria$stunting)

table(nigeria$munemployed)
#unemployed   employed 
#      9099      22383 
plot(nigeria$munemployed, nigeria$stunting)

table(nigeria$mreligion)
#    1     2     3     4    96    99 
# 2540 10114 18354   302    12   160
plot(nigeria$mreligion, nigeria$stunting)

table(nigeria$mresidence)
#Urban Rural 
#10351 21131
plot(nigeria$mresidence, nigeria$stunting)

table(nigeria$deadchildren)
#     0     1     2     3     4     5     6     7     8     9    10    11    12
# 19329  6573  2959  1416   666   297   117    74    29    13     6     2     1
nigeria$deadchildren[nigeria$deadchildren>3] <- 3
nigeria$deadchildren <- factor(nigeria$deadchildren)
plot(nigeria$deadchildren, nigeria$stunting)

table(nigeria$electricity) # hier muss noch, erstmal provisorisch
#    0     1     7     9
#16588 14577   268    49
nigeria$electricity[nigeria$electricity > 1] <- NA
nigeria$electricity<- factor(nigeria$electricity, labels=c("no","yes"))
plot(nigeria$electricity, nigeria$stunting)

table(nigeria$radio) # hier muss auch noch, erstmal provisorisch
#    0     1     7     9
#10042 21134   268    38
nigeria$radio[nigeria$radio > 1] <- NA
nigeria$radio<- factor(nigeria$radio, labels=c("no","yes"))
plot(nigeria$radio, nigeria$stunting)

table(nigeria$television)
#    0     1     7     9
#18007 13130   268    77
nigeria$television[nigeria$television > 1] <- NA
nigeria$television<- factor(nigeria$television, labels=c("no","yes"))
plot(nigeria$television, nigeria$stunting)

table(nigeria$refrigerator)
#    0     1     7     9
#26253  4908   268    53
nigeria$refrigerator[nigeria$refrigerator > 1] <- NA
nigeria$refrigerator<- factor(nigeria$refrigerator, labels=c("no","yes"))
plot(nigeria$refrigerator, nigeria$stunting)

table(nigeria$bicycle)
#    0     1     7     9
#24128  6884   268   202 
nigeria$bicycle[nigeria$bicycle > 1] <- NA
nigeria$bicycle<- factor(nigeria$bicycle, labels=c("no","yes"))
plot(nigeria$bicycle, nigeria$stunting)

table(nigeria$motorcycle)
#    0     1     7     9 
#18434 12600   268   180
nigeria$motorcycle[nigeria$motorcycle > 1] <- NA
nigeria$motorcycle<- factor(nigeria$motorcycle, labels=c("no","yes"))
plot(nigeria$motorcycle, nigeria$stunting)

table(nigeria$car)
#    0     1     7     9
#28248  2756   268   210
nigeria$car[nigeria$car > 1] <- NA
nigeria$car<- factor(nigeria$car, labels=c("no","yes"))

plot(nigeria$car, nigeria$stunting)

# store only complete cases

nigeria <- nigeria[complete.cases(nigeria),]

# coding of factors

nigeria$csex <- as.numeric(nigeria$csex)-1  # male = 0, female = 1
nigeria$ctwin <- as.numeric(nigeria$ctwin)-1  # single birth = 0, twin = 1
nigeria$munemployed <- as.numeric(nigeria$munemployed)-1  # unemployed = 0, employed = 1
nigeria$mresidence <- as.numeric(nigeria$mresidence)-1  # urban = 0, rural = 1
nigeria$electricity <- as.numeric(nigeria$electricity)-1  # no = 0, yes = 1
nigeria$radio <- as.numeric(nigeria$radio)-1  # no = 0, yes = 1
nigeria$television <- as.numeric(nigeria$television)-1  # no = 0, yes = 1
nigeria$refrigerator <- as.numeric(nigeria$refrigerator)-1  # no = 0, yes = 1
nigeria$bicycle <- as.numeric(nigeria$bicycle)-1  # no = 0, yes = 1
nigeria$motorcycle <- as.numeric(nigeria$motorcycle)-1  # no = 0, yes = 1
nigeria$car <- as.numeric(nigeria$car)-1  # no = 0, yes = 1

nigeria$cbirthorder2 <- nigeria$cbirthorder3 <- nigeria$cbirthorder4 <- nigeria$cbirthorder5 <- 0
nigeria$cbirthorder2[nigeria$cbirthorder==2] <- 1
nigeria$cbirthorder3[nigeria$cbirthorder==3] <- 1
nigeria$cbirthorder4[nigeria$cbirthorder==4] <- 1
nigeria$cbirthorder5[nigeria$cbirthorder==5] <- 1

nigeria$deadchildren1 <- nigeria$deadchildren2 <- nigeria$deadchildren3 <- 0
nigeria$deadchildren1[nigeria$deadchildren==1] <- 1
nigeria$deadchildren2[nigeria$deadchildren==2] <- 1
nigeria$deadchildren3[nigeria$deadchildren==3] <- 1

nigeria$mreligion[nigeria$mreligion==5] <- 5
nigeria$mreligion[nigeria$mreligion==6] <- 5
nigeria$mreligion[nigeria$mreligion==7] <- 5
nigeria$mreligion[nigeria$mreligion==8] <- 5
nigeria$mreligion[nigeria$mreligion==9] <- 5
nigeria$mreligion[nigeria$mreligion==10] <- 5
nigeria$mreligion[nigeria$mreligion==11] <- 5
nigeria$mreligion[nigeria$mreligion==96] <- 5

nigeria$mreligion2 <- nigeria$mreligion3 <- nigeria$mreligion4 <- nigeria$mreligion5 <- 0
nigeria$mreligion2[nigeria$mreligion==2] <- 1
nigeria$mreligion3[nigeria$mreligion==3] <- 1
nigeria$mreligion4[nigeria$mreligion==4] <- 1
nigeria$mreligion5[nigeria$mreligion==5] <- 1

#divide stunting and wasting score by 100 for numerical stability reasons of the analysis
#and store them in new variable stunting2 and wasting2

nigeria$stunting2 <- nigeria$stunting / 100
nigeria$wasting2 <- nigeria$wasting / 100

#genereate weights for cross validation. We use ten parts and weights are assigned randomly

nparts <- 10
n <- dim(nigeria)[1]
parti <- n %/% nparts
rest <- n %% nparts

index <- c(as.vector(replicate(parti, sample(1:nparts, size = nparts, replace = FALSE))), sample(1:nparts, size = rest, replace = FALSE))

index2 <- sample(1:n, size = n, replace = TRUE)
index <- index[index2]

#define the weight vectors and add them to dataset
for(i in 1:nparts) {   
  nigeria[[paste("w", i, sep = "")]] <- -1 * (index == i) + 1  
}

nigeria$urban <- as.numeric(nigeria$urban) - 1


nigeria$cage2 <- (nigeria$cage - mean(nigeria$cage) ) / sd(nigeria$cage)
nigeria$mage2 <- (nigeria$mage - mean(nigeria$mage) ) / sd(nigeria$mage)
nigeria$mbmi2 <- (nigeria$mbmi - mean(nigeria$mbmi) ) / sd(nigeria$mbmi)
nigeria$cbmi2 <- (nigeria$cbmi - mean(nigeria$cbmi) ) / sd(nigeria$cbmi)
nigeria$wealth2 <- (nigeria$wealth - mean(nigeria$wealth) ) / sd(nigeria$wealth)

write.table(nigeria, "nigeria2.raw", col.names=TRUE, row.names=FALSE, sep=" ", quote=FALSE)
save("nigeria", file="nigeria2.Rdata")

