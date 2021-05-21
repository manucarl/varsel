

hyper <- function (Z, Kinv, a = 5, c = 0.1, alpha1 = 0.1, alpha2 = 0.1, 
          R = 10000, myseed = 123) 
{
  require("mvtnorm")
  require("pscl")
  ztKz <- Z%*%Kinv%*%t(Z)
  simsup <- function(b, delta, r) {
    set.seed(myseed)
    psisample <- rigamma(n = R, alpha = a, beta = b)
    
    rhelp <- r^(1 - delta)
    tausample <- rnorm(n = R, mean = 0, sd = sqrt(psisample * 
                                                    rhelp))

      d <- dim(Kinv)[1]
      s <- svd((Kinv + t(Kinv))/2)
      s$d <- abs(zapsmall(s$d))
      m <- sum(s$d > 0)
      x <- matrix(rnorm(m*R), nrow=m)
      x <- rbind(x, matrix(0, nrow=d-m, ncol=R))
      bsample <- s$u %*% diag(sqrt(s$d)) %*% x
      fsample <- t(Z %*% bsample)
    
    fsample <-fsample * abs(tausample)
   dim(fsample)
    supsample <- apply(abs(fsample), 1, max)
    #supsample <- apply(abs(fsample), 1, mean)
    
    print("finish simsup")
    print(all(is.finite(supsample)))
     return(supsample)
  }
  cat("Optimising b\n")
  optfn1 <- function(b, c) {
    quantile(simsup(b = b, delta = 1, r = 1), probs = alpha1) - 
      c
  }
  (bopt <- uniroot(f = optfn1, interval = c(0.000001, upper = 1000000), 
                   c = c))
  bopt <- bopt$root
  cat("Optimising r\n")
  
  optfn2 <- function(r, b, c) {
    quantile(simsup(b = b, delta = 0, r = r), probs = 1 - 
               alpha2) - c
  }
  (ropt <- uniroot(f = optfn2, interval = c(0.000001, upper = 0.5), 
                   b = bopt, c = c))
  ropt <- ropt$root
  res <- list(b = bopt, r = ropt)
  return(res)
}