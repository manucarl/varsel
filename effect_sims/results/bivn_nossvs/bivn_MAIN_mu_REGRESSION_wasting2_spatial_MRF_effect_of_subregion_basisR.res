BayesX.design.matrix <- function(x, ...) {
  w <- getOption("warn")
  options(warn = -1)
  tx <- as.integer(as.character(unlist(x)))
  options("warn" = w)
  x <- if(!any(is.na(tx))) tx else as.integer(x)
  levels <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37)
  x <- factor(x, levels = levels)
  X <- diag(length(levels))[x, ]
  attr(X, "type") <- "mrf"
  return(X)
}
