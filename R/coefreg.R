#' @title coef.reg
#' @description
#' Function to return the coefficients for object reg.
#'
#' @param object A reg class object
#' @param ... other arguments
#'
#' @returns Returns all estimated coefficients for the linear model
#' @export coef.reg
#' @export
#'
#' @examples coef(linreg(Sepal.Length ~ Sepal.Width, iris)) ## 6.526223  -0.2233611

coef.reg <- function(object, ...){
  # Named vector
  output <- t(object$beta)
  rownames(output) <- ""
  return(output)
}
