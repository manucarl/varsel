basisZ_mage<-function(x, ...) {
  require("splines")
  x <- unlist(x)
  knots <- c(-3.29786, -2.99581, -2.69376, -2.3917, -2.08965, -1.7876, -1.48555, -1.1835, -0.881449, -0.579398, -0.277347, 0.024704, 0.326755, 0.628806, 0.930857, 1.23291, 1.53496, 1.83701, 2.13906, 2.44111, 2.74316, 3.04522, 3.34727, 3.64932, 3.95137, 4.25342)
  degree <- 3
  ll <- knots[degree + 1]
  ul <- knots[length(knots) - degree]
  degree <- degree + 1
  n <- length(x)
  ind <- x <= ul & x >= ll
  if(sum(ind) == n) {
    X <- spline.des(knots, x, degree)$design
  } else {
    D <- spline.des(knots, c(ll, ll, ul, ul), degree, c(0, 1, 0, 1))$design
    X <- matrix(0, n, ncol(D))
    X[ind, ] <- spline.des(knots, x[ind], degree)$design
    ind <- x < ll
    if(sum(ind) > 0) 
    X[ind, ] <- cbind(1, x[ind] - ll) %*% D[1:2, ]
    ind <- x > ul
    if(sum(ind) > 0)
    X[ind, ] <- cbind(1, x[ind] - ul) %*% D[3:4, ]
  }
  attr(X, "type") <- "ps"
  return(X)
}
