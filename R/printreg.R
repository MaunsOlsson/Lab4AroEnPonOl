#' @title print.reg
#' @description
#' This prints out a regression model created from the function linreg.
#'
#' @param x A reg class object
#'
#' @returns Returns the coefficients of the linear regression model
#' @export print.reg
#' @export
#'
#' @examples print(linreg(Sepal.Length ~ Sepal.Width, iris)) ## Coefficients: 6.526223  -0.2233611

print.reg <- function(x){
  print(x$data)
  cat("\nCoefficients:\n")
  print_df <- as.data.frame(t(x$beta))
  rownames(print_df) <- ""
  print(print_df)
}
