#===============================================
#Function to compute scores for selected discrete
#distributions
#-----------------------------------------------
#Author: Nadja Klein
#===============================================


scores_d <- function(response = NULL, param = matrix(), family = "poisson", weights = NULL,
                     limits = NULL, average = TRUE,
                     contributions = FALSE, ...)
{
  require(gamlss)
  require(VGAM)
  if(.Platform$OS.type!="windows")
  {
    require(multicore)
  }
  timestamp()
  if(is.null(response))
  {
    response <- 0
    warning("response not specified")
  }
  if(!is.matrix(param))
  {
  param <- matrix(param, ncol = 1)
  }
  if(dim(param)[1]!=length(response))
  {
    stop("number of observations has to coincide with length of parameter vectors") 
  }
  if(is.null(weights))
  {
    w <- rep(0, length(response))
  }
  if(!is.null(weights))
  {
    w <- weights
    if(length(w) != length(response))
    {
      stop("number of weights has to be equal with number of observations")
    }
    if(any(w>1))
    {
      warning("only observations with weight = 0 will be taken for computations")
    }
  }
  ind <- which(w == 0)
  response <- response[ind]
  param <- param[ind, ]
  if(!is.matrix(param))
  {
    param <- matrix(param, ncol = 1)
  }
  
  #===================================================================================
  if(family == "poisson")
  {
    message("Please make sure that that first column of param contains lambda")
    if(dim(param)[2]!=1)
    {
      stop("poisson distributon requires one parameter") 
    }

get.norm <- function(i) {
  integrand <- function(x) {
    (dpois(x,lambda=param[i,1]))^2
  }
  ygrid <- seq(0,max(response))
  norm <- sum(integrand(ygrid))
  return(norm)
}

get.quadr.score <- function(i) {
  integrand <- function(x) {
    xl <- length(x)
    -sum((((x==response[i])*1-dpois(x,lambda=param[i,1]))^2))
  }
  ygrid <- seq(0,max(response))
  norm <- (integrand(ygrid))
  return(norm)
}    
    if(.Platform$OS.type=="windows")
    {
      norm.res <- lapply(1:length(response), FUN=get.norm)
	  norm.res2 <- lapply(1:length(response), FUN=get.quadr.score)
    }
    else
    {
      norm.res <- mclapply(1:length(response), FUN=get.norm, ...)
	  norm.res2 <- mclapply(1:length(response), FUN=get.quadr.score, ...)
    }
    
    norm.end <- (unlist(norm.res))
	norm.end2 <- (unlist(norm.res2))
    
    prob.pred <- (dpois(response,lambda=param[,1]))
    
    loglikeli.score <- log(prob.pred)
    
    quadratic.score <- norm.end2
    
    spherical.score <- ((dpois(response, lambda = param[,1]))/(sqrt((norm.end))))
    
    if(!contributions)
    {
      if(average)
      {
        loglikeli.score <- mean(loglikeli.score)
        quadratic.score <- mean(quadratic.score)
        spherical.score <- mean(spherical.score)
      }
      else
      {
        loglikeli.score <- sum(loglikeli.score)
        quadratic.score <- sum(quadratic.score)
        spherical.score <- sum(spherical.score)
      }
    }
    
    result <- data.frame(quadratic.score = quadratic.score, loglikeli.score = loglikeli.score, spherical.score = spherical.score)
    
  }
  
  #===================================================================================
  else if(family == "zip")
  {
    message("Please make sure that that first column of param contains lambda and second column pi")
    if(dim(param)[2]!=2)
    {
      stop("zip distributon requires two parameters") 
    }
    get.norm <- function(i) {
  integrand <- function(x) {
    (dzipois(x,lambda=param[i,1], pstr0 = param[i,2]))^2
  }
  ygrid <- seq(0,max(response))
  norm <- sum(integrand(ygrid))
  return(norm)
}

get.quadr.score <- function(i) {
  integrand <- function(x) {
    xl <- length(x)
    -sum((((x==response[i])*1-dzipois(x,lambda=param[i,1], pstr0 = param[i,2]))^2))
  }
  ygrid <- seq(0,max(response))
  norm <- (integrand(ygrid))
  return(norm)
}    
    if(.Platform$OS.type=="windows")
    {
      norm.res <- lapply(1:length(response), FUN=get.norm)
	  norm.res2 <- lapply(1:length(response), FUN=get.quadr.score)
    }
    else
    {
      norm.res <- mclapply(1:length(response), FUN=get.norm, ...)
	  norm.res2 <- mclapply(1:length(response), FUN=get.quadr.score, ...)
    }
    
    norm.end <- (unlist(norm.res))
	norm.end2 <- (unlist(norm.res2))
    
    prob.pred <- (dzipois(response,lambda=param[,1], pstr0 = param[,2]))
    
    loglikeli.score <- log(prob.pred)
    
    quadratic.score <- norm.end2
    
    spherical.score <- ((dzipois(response, lambda = param[,1], pstr0 = param[,2]))/(sqrt((norm.end))))
    
    if(!contributions)
    {
      if(average)
      {
        loglikeli.score <- mean(loglikeli.score)
        quadratic.score <- mean(quadratic.score)
        spherical.score <- mean(spherical.score)
      }
      else
      {
        loglikeli.score <- sum(loglikeli.score)
        quadratic.score <- sum(quadratic.score)
        spherical.score <- sum(spherical.score)
      }
    }
    
    result <- data.frame(quadratic.score = quadratic.score, loglikeli.score = loglikeli.score, spherical.score = spherical.score)
    
    
  }
  
     #===================================================================================
  else if(family == "negbin")
  {
    message("Please make sure that that first column of param contains mu and second column delta")
    if(dim(param)[2]!=2)
    {
      stop("negbin distributon requires two parameters") 
    }
    get.norm <- function(i) {
  integrand <- function(x) {
    (dnbinom(x,mu=param[i,1], size = param[i,2]))^2
  }
  ygrid <- seq(0,max(response))
  norm <- sum(integrand(ygrid))
  return(norm)
}

get.quadr.score <- function(i) {
  integrand <- function(x) {
    xl <- length(x)
    -sum((((x==response[i])*1-dnbinom(x,mu=param[i,1], size = param[i,2]))^2))
  }
  ygrid <- seq(0,max(response))
  norm <- (integrand(ygrid))
  return(norm)
}    
    if(.Platform$OS.type=="windows")
    {
      norm.res <- lapply(1:length(response), FUN=get.norm)
	  norm.res2 <- lapply(1:length(response), FUN=get.quadr.score)
    }
    else
    {
      norm.res <- mclapply(1:length(response), FUN=get.norm, ...)
	  norm.res2 <- mclapply(1:length(response), FUN=get.quadr.score, ...)
    }
    
    norm.end <- (unlist(norm.res))
	norm.end2 <- (unlist(norm.res2))
    
    prob.pred <- (dnbinom(response,mu=param[,1], size = param[,2]))
    
    loglikeli.score <- log(prob.pred)
    
    quadratic.score <- norm.end2
    
    spherical.score <- ((dnbinom(response, mu = param[,1], size = param[,2]))/(sqrt((norm.end))))
    
    if(!contributions)
    {
      if(average)
      {
        loglikeli.score <- mean(loglikeli.score)
        quadratic.score <- mean(quadratic.score)
        spherical.score <- mean(spherical.score)
      }
      else
      {
        loglikeli.score <- sum(loglikeli.score)
        quadratic.score <- sum(quadratic.score)
        spherical.score <- sum(spherical.score)
      }
    }
    
    result <- data.frame(quadratic.score = quadratic.score, loglikeli.score = loglikeli.score, spherical.score = spherical.score)
    
    
  }
      #===================================================================================
  else if(family == "zinb")
  {
    message("Please make sure that that first column of param contains mu, second column delta and third column pi")
    if(dim(param)[2]!=3)
    {
      stop("zinb distributon requires two parameters") 
    }
    get.norm <- function(i) {
  integrand <- function(x) {
    (dzinegbin(x,munb=param[i,1], size = param[i,2], pstr0 = param[i,3]))^2
  }
  ygrid <- seq(0,max(response))
  norm <- sum(integrand(ygrid))
  return(norm)
}

get.quadr.score <- function(i) {
  integrand <- function(x) {
    xl <- length(x)
    -sum((((x==response[i])*1-dzinegbin(x,munb=param[i,1], size = param[i,2], pstr0 = param[i,3]))^2))
  }
  ygrid <- seq(0,max(response))
  norm <- (integrand(ygrid))
  return(norm)
}    
    if(.Platform$OS.type=="windows")
    {
      norm.res <- lapply(1:length(response), FUN=get.norm)
	  norm.res2 <- lapply(1:length(response), FUN=get.quadr.score)
    }
    else
    {
      norm.res <- mclapply(1:length(response), FUN=get.norm, ...)
	  norm.res2 <- mclapply(1:length(response), FUN=get.quadr.score, ...)
    }
    
    norm.end <- (unlist(norm.res))
	norm.end2 <- (unlist(norm.res2))
    
    prob.pred <- (dzinegbin(response,munb=param[,1], size = param[,2], pstr0 = param[,3]))
    
    loglikeli.score <- log(prob.pred)
    
    quadratic.score <- norm.end2
    
    spherical.score <- ((dzinegbin(response, munb = param[,1], size = param[,2], pstr0 = param[,3]))/(sqrt((norm.end))))
    
    if(!contributions)
    {
      if(average)
      {
        loglikeli.score <- mean(loglikeli.score)
        quadratic.score <- mean(quadratic.score)
        spherical.score <- mean(spherical.score)
      }
      else
      {
        loglikeli.score <- sum(loglikeli.score)
        quadratic.score <- sum(quadratic.score)
        spherical.score <- sum(spherical.score)
      }
    }
    
    result <- data.frame(quadratic.score = quadratic.score, loglikeli.score = loglikeli.score, spherical.score = spherical.score)
    
    
  }

  else
  {
    
    stop("family not implemented")
  }
  
  
  return(result)
  
}