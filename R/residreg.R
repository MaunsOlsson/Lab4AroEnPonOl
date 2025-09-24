#' @title resid.reg
#'
#' @param x A reg class object
#'
#' @returns Returns all the residuals for the linear model
#' @export
#'
#' @examples

residuals.reg <- function(x){
  x$e
}
