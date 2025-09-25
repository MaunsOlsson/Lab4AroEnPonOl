#' @title residuals.reg
#' @description
#' Applied residual function for object reg.
#'
#' @param object A reg class object
#' @param ... other arguments
#'
#' @returns Returns all the residuals for the linear model
#' @export residuals.reg
#' @export
#'
#' @examples
#' residuals(linreg(Sepal.Length ~ Sepal.Width, iris))[1:5]

residuals.reg <- function(object, ...){
  object$e
}
