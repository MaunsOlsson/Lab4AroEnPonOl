#' @title coef.reg
#'
#' @param x A reg class object
#'
#' @returns Returns all estimated coefficients for the linear model
#' @export coef.reg
#' @export
#'
#' @examples coef(linreg(Sepal.Length ~ Sepal.Width, iris)) ## 6.526223  -0.2233611

coef.reg <- function(x){
  # Named vector
  output <- t(x$beta)
  rownames(output) <- ""
  return(output)
}
