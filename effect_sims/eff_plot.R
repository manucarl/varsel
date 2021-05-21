## ---------------------------
##
## Script name: eff_plot.R
##
## Purpose of script: generates simulated effect plots that are reconstructed on basis of posterior linear samples + samples of the nonlinear deviation
## Author: Manuel Carlan
##
## Date Created: 2021-05-1
##
## Email: mcarlan@uni-goettingen.de
##
## ---------------------------



library(dplyr)
library(rlang)
library(ggplot2)

rm(list = ls())


data <- read.table("effect_sims/data/data.raw", header = TRUE) %>% as_tibble

# what effects to plot
fs <- 9:12

# rep number
R <- 25

true_eff_data <- data %>%
  slice(1:200) %>%
  dplyr::select(paste0("x", fs), paste0("f", fs)) %>% 
  mutate_at(paste0("f", fs),  ~ scale(., scale=F) %>% as.vector) %>% 
  
  pivot_longer(everything(),
               names_to = c(".value", "eff_name"),
               names_pattern = "(.)(.+)")



eff_rep_data <- lapply(1:R, function(rep){
  lapply(fs, FUN=function(k){
    var <- paste0("x",k)
    path <- paste0("effect_sims/results/y_",rep,"/y_", rep, "_MAIN_mu_REGRESSION_y", rep)
    
    nl_part <- read.table(paste0(path, "_nonlinear_pspline_effect_of_x",k, ".res"), header=T )
    x <- sort(pull(data, var))
    lin_part <- read.table(paste0(path, "_LinearEffects_ssvs.res"), header=T )
    
    
    lin_coef_samples <- read.table(paste0(path, "_LinearEffects_ssvs_sample.raw"), header=T )
    nl_coef_samples <- read.table(paste0(path, "_nonlinear_pspline_effect_of_x",k , "_sample.raw"), header=T )
    
    source(paste0(path, "_nonlinear_pspline_effect_of_x",k , "_basisR.res"))
    nl_effect_samples <- BayesX.design.matrix(x)%*%t(nl_coef_samples[,-1])
    lin_effect_samples <- t(t(x))%*%t(lin_coef_samples[, paste0("b_",k)])
    
    complete_effect_samples <- nl_effect_samples + lin_effect_samples
    
    tibble(x,  f = scale(rowMeans(complete_effect_samples), scale=F))
  }
  )%>% set_names(fs) %>% 
    bind_rows(.id="eff_name")
} 
)%>% 
  bind_rows(.id="replication")

gg_data <- bind_rows(true_eff_data %>% mutate(replication = 0), eff_rep_data %>% mutate(replication = as.numeric(replication)))
p <- ggplot(gg_data) + geom_line(aes(x=x, y=f, group=as.numeric(replication)), alpha=0.5) +
  facet_wrap(~factor(eff_name, levels=fs), scales="free") +
  geom_line(data= gg_data %>% filter(replication == 0), aes(x=x, y=f), col= "red", size=1)

p
# ggsave(paste0("f",paste0(fs,collapse="_") ,".png"), plot=p)
