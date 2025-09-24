#' @title coef.reg
#'
#' @param x A reg class object
#'
#' @returns Returns all estimated coefficients for the linear model
#' @export
#'
#' @examples
#' coef(linreg(Sepal.Length ~ Sepal.Width, iris))

coef.reg <- function(x){
  # Named vector
  x$beta
}
