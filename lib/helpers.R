helper.ZeroMinScale <- function(x, ...) {
  (x-min(x, ...))/(max(x, ...) - min(x, ...))
}

# define some of the error estimaste functions here to be used later

helper.RSquared <- function(observed, predicted, ...) {
  
  ss_res <- sum((observed - predicted)^2, ...)
  ss_tot <- sum((observed - mean(observed, ...))^2, ...)
  
  1 - (ss_res/ss_tot)
}

helper.RSquaredAdjsuted <- function(R2, n, p) {
  1 - (1 - R2)*((n - 1)/(n - p - 1))
}

helper.RMSE <- function(observed, predicted, ...) {
  sqrt(mean((observed - predicted)^2, ...))
}