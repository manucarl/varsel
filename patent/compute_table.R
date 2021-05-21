source("patent/Rfiles/scores_d.R")


data <- read.table("patent/data/patent.raw", header = TRUE)
data <- subset(data, nclaims <= 50)
y <- data$ncit


# calculate scores for model with alpha=0.1
path <- "patent/results/score_batches_zip_ssvs_alpha0.1/"
result <- c()
para <- matrix(NA, ncol = 2, nrow = dim(data)[1])

for(i in 1:10)
{
  predict <- read.table(paste0(path, "predict", i, 
                              "\\lambda_MAIN_lambda_REGRESSION_ncit_predict.res", sep = ""), header = TRUE)
  weight <- data[,which(names(data) == paste("w", i, sep = ""))]
  index <- which(weight==0)
  para[index,] <- cbind(predict$pmean_param_lambda[index], predict$pmean_param_pi[index])

}

DIC_alpha010 <- read.table(paste0("patent/results/full_zip_ssvs_alpha0.1/lambda_MAIN_lambda_REGRESSION_ncit_predict_DIC.res"), header=T)[[3]]
WAIC_alpha010 <- read.table(paste0("patent/results/full_zip_ssvs_alpha0.1/lambda_MAIN_lambda_REGRESSION_ncit_predict_WAIC.res"), header=T)[[3]]

scores_ZIP_ssvs_alpha010<-  scores_d(data$ncit, para, family = "zip", average = FALSE)
scores_ZIP_ssvs_alpha010



# calculate scores for model with alpha=0.05
path <- "patent/results/score_batches_zip_ssvs_alpha0.05/"

result <- c()

para <- matrix(NA, ncol = 2, nrow = dim(data)[1])

for(i in 1:10)
{
  predict <- read.table(paste0(path, "predict", i, 
                              "\\lambda_MAIN_lambda_REGRESSION_ncit_predict.res", sep = ""), header = TRUE)
  weight <- data[,which(names(data) == paste("w", i, sep = ""))]
  index <- which(weight==0)
  para[index,] <- cbind(predict$pmean_param_lambda[index], predict$pmean_param_pi[index])

}
DIC_alpha005 <- read.table(paste0("patent/results/full_zip_ssvs_alpha0.05/lambda_MAIN_lambda_REGRESSION_ncit_predict_DIC.res"), header=T)[[3]]
WAIC_alpha005 <- read.table(paste0("patent/results/full_zip_ssvs_alpha0.05/lambda_MAIN_lambda_REGRESSION_ncit_predict_WAIC.res"), header=T)[[3]]


scores_ZIP_ssvs_alpha005<-  scores_d(data$ncit, para, family = "zip", average = FALSE)
scores_ZIP_ssvs_alpha005



# calculate scores for ZIP_DIC model
path <- "patent/results/score_batches_zip/"

result <- c()

para <- matrix(NA, ncol = 2, nrow = dim(data)[1])

for(i in 1:10)
{
  predict <- read.table(paste0(path, "predict", i, 
                              "\\lambda_MAIN_lambda_REGRESSION_ncit_predict.res", sep = ""), header = TRUE)
  weight <- data[,which(names(data) == paste("w", i, sep = ""))]
  index <- which(weight==0)
  para[index,] <- cbind(predict$pmean_param_lambda[index], predict$pmean_param_pi[index])

}

DIC_nossvs <- read.table(paste0("patent/results/full_zip/lambda_MAIN_lambda_REGRESSION_ncit_predict_DIC.res"), header=T)[[3]]
WAIC_nossvs <- read.table(paste0("patent/results/full_zip/lambda_MAIN_lambda_REGRESSION_ncit_predict_WAIC.res"), header=T)[[3]]

scores_ZIP_nossvs <-  scores_d(data$ncit, para, family = "zip", average = FALSE)
scores_ZIP_nossvs

library(dplyr)
crit_table <- bind_rows(DIC=scores_ZIP_nossvs,
                        alpha010=scores_ZIP_ssvs_alpha010,
                        alpha005=scores_ZIP_ssvs_alpha005,
                        .id="Model") %>%
              mutate(DIC=c(DIC_nossvs, DIC_alpha005, DIC_alpha010),
                     WAIC=c(WAIC_nossvs, WAIC_alpha005, WAIC_alpha010)) %>% as_tibble()

crit_table
