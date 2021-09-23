## ---------------------------
##
## Script name: normal_dgp.R
##
## Purpose of script: generates simulation data for Gaussian mean model for effect selection on basis of the NBPSS prior
## Author: Manuel Carlan
##
## Date Created: 2021-05-1
##
## Email: mcarlan@uni-goettingen.de
##
## ---------------------------

# rm(list = ls())
library(BayesX)
library("scales")

set.seed(123)
# normal family
family <- "normal"

# unsparse scenario
k <- 16           
######################################################################################################
# ad hoc settings ####################################################################################
######################################################################################################
snr <- 20 # for Gaussian mean model

# number of different y responses
R <- 150

# observation number of  training data
n_train <- 200

# size of training data set
n_test <- 0

n <- n_train + n_test
# true spatial effect?
spatial <- FALSE

######################################################################################################
# read in map for spatial effect #####################################################################
######################################################################################################
# western germany: 327 regions
map <- read.bnd("effect_sims/spatial/westerngermany.bnd")

# determine precision matrix via neighbourhood structure
pmat <- read.gra("effect_sims/spatial/westerngermany.gra")

# get centroids
centr <- as.data.frame((get.centroids(map)))
# data.frame, nrow = no. of polygons
helpdata <- data.frame(nr=1:length(map))
# read region ids
helpdata$region<- names(map)
# get x and y coordinates of centroids seperately
helpdata$xcoord <- centr$centroid_x
helpdata$ycoord <- centr$centroid_y

# standardize x and y coordinates of centroids
#helpdata$xsd <- (centr$centroid_x-mean(centr$centroid_x))/sd(centr$centroid_x)
helpdata$xsd <- scale(centr$centroid_x)
#helpdata$ysd <- (centr$centroid_y-mean(centr$centroid_y))/sd(centr$centroid_y)
helpdata$ysd <- scale(centr$centroid_y)
# spatial predictor (?) mrf
helpdata$falpha <-sin(helpdata$xsd)*cos(0.5*helpdata$ysd)
helpdata$falpha <- scale(helpdata$falpha, center = TRUE, scale = FALSE)
helpdata <- helpdata[,-1]

#################################################################################################
#remove splitted region (make one centroid for them)
# get regions that are splitted
regionid <- (row.names(centr))[duplicated(row.names(centr))]
indremove <- c()
for(i in 1:length(regionid)) {
  indexmap <- which(row.names(centr)==regionid[i])
  centr$centroid_x[indexmap] <- mean(centr$centroid_x[indexmap])
  centr$centroid_y[indexmap] <- mean(centr$centroid_y[indexmap])
  centr$area[indexmap] <- sum(centr$area[indexmap])
}

# regions
findid <- unlist(dimnames(pmat)[2])
centroids <- data.frame(region=findid)

for(i in 1:length(findid)) {
  index <- which(findid[i]==row.names(centr))
  centroids$area[i] <- centr$area[index[1]]
  centroids$centroid_x[i] <- centr$centroid_x[index[1]]
  centroids$centroid_y[i] <- centr$centroid_y[index[1]]
}

helpdata <- data.frame(nr=1:length(findid))
helpdata$region<- findid
helpdata$xcoord <- centroids$centroid_x
helpdata$ycoord <- centroids$centroid_y
helpdata$xsd <- (centroids$centroid_x-mean(centroids$centroid_x))/sd(centroids$centroid_x)
helpdata$ysd <- (centroids$centroid_y-mean(centroids$centroid_y))/sd(centroids$centroid_y)
helpdata$falpha <-sin(helpdata$xsd)*cos(0.5*helpdata$ysd)


helpdata$falpha <- helpdata$falpha-mean(helpdata$falpha)
helpdata <- helpdata[,-1]

region <- (unlist(dimnames(pmat)[2]))
regdat <- (data.frame(region,helpdata$falpha))


######################################################################################################
# dgp          #######################################################################################
######################################################################################################



# 4 original functions
ff1 <- function(x) x
ff2 <- function(x) x + ((2*x-2)^2)/5.5
ff3 <- function(x) -x + pi*sin(pi*x)
ff4 <- function(x) .5*x + 15*(dnorm((x-.2)/.5) - dnorm(x+.4))

# build design matrix similar to Scheipl
# draw values of x; 2 digits
x <- round(runif(n*k, -2, 2),2)

# correlation rho of covariates 
rho <- 0

# generate correlation matrix
S <- rho^as.matrix(dist(1:k))

# generate design matrix
X <- matrix(x, ncol=k, nrow = n)%*%chol(S)

colnames(X) <- c(paste("x", 1:k, sep="")) 

f1 <- ff1(X[,1])
#f1 <- f1 - mean(f1)
f1 <- scale(f1)

f2 <- ff2(X[,2])
#f2 <- f2 - mean(f2)
f2 <- scale(f2)

f3 <- ff3(X[,3])
#f3 <- f3 - mean(f3)
f3 <- scale(f3)

f4 <- ff4(X[,4])
#f4 <- f4 - mean(f4)
f4 <- scale(f4)

f5 <- ff1(X[,5])
#f5 <- f5 - mean(f5)
f5 <- 1.5 * scale(f5)

f6 <-  ff2(X[,6])
#f6 <- f6 - mean(f6)
f6 <- 1.5 *scale(f6)

f7 <-  ff3(X[,7])
#f7 <- f7 - mean(f7)
f7 <- 1.5 *scale(f7)

f8 <-  ff4(X[,8])
#f8 <- f8 - mean(f8)
f8 <- 1.5 *scale(f8)

f9 <-  ff1(X[,9])
#f9 <- f9 - mean(f9)
f9 <- 2 *scale(f9)

f10 <-  ff2(X[,10])
#f10 <- f10 - mean(f10)
f10 <- 2 *scale(f10)

f11 <- ff3(X[,11])
#f11 <- f11 - mean(f11)
f11 <- 2 * scale(f11)

f12 <- ff4(X[,12]) 
#f12 <- f12 - mean(f12)
f12 <- 2 * scale(f12)

# additive predictor (unsparse scenario)
eta <- f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8 + f9 + f10 + f11 + f12

true_sm <- c(rep(c(F,T,T,T),t=3), rep(F, k-12))
true_lin <- c(rep(T,12), rep(F, k-12))
true <- c(rep(c(T,F, T,T, T,T, T,T),t=3), rep(F, 2*(k-12)))




n <- n_train + n_test
nregion <- floor(n/length(regdat[,1]))

region <- c()

# if additional observations are needed
if(nregion > 0) {
  for(i in 1:nregion) {
    region <- c(region,sample(as.character(regdat[,1]),size=length(regdat[,1]),replace=F))
  }
  region <- c(region,sample(as.character(regdat[,1]),size=(n-nregion*length(regdat[,1])),replace=T))
  
} else {
  
  region <- c(region,sample(as.character(regdat[,1]),size=(n-nregion*length(regdat[,1])),replace=T)) 
}

if(spatial == T){
  fspatalpha <- rep(0,n)
  for(i in 1:n){
    fspatalpha[i] <- helpdata$falpha[region[i]==helpdata$region]
  }
  # fspatalpha <- scale(fspatalpha)
  # scale spatial effect in similar range 
  eta <- eta + 4*fspatalpha
}else{
  eta <- eta
}


# responses
y <- matrix(ncol=R, nrow=(n), 0)  



####################################### NORMAL
for(i in 1:R){
  eps <- scale(rnorm(n = n))
  eps <- as.vector(eps)
  eps <- sqrt(var(eta)/snr)*eps
  y[,i] <- round(eta + eps,5)
}


########################################################################################################################
# final data set
########################################################################################################################
# X <- round(scale(X),2)
colnames(y) <- paste0("y", 1:R)


data <- data.frame(
  cbind(
    X, region, y, eta, w = c(rep(1,n_train), rep(0, n_test))
    ),
  f1=f1, f2=f2, f3=f3, f4=f4, f5=f5, f6=f6, f7=f7, f8=f8, f9=f9, f10=f10, f11=f11, f12=f12
)


write.table(data, "effect_sims/data/data.raw", row.names=FALSE, sep=" ", quote=FALSE)






