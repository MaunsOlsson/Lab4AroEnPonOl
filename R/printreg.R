#' @title print.reg
#'
#' @param x A reg class object
#'
#' @returns Returns the coefficients of the linear regression model
#' @export
#'
#' @examples print(linreg(Sepal.Length ~ Sepal.Width, iris)) ## Coefficients: 6.526223  -0.2233611

print.reg <- function(x){
  cat("Coefficients:\n")
  print_df <- as.data.frame(t(x$beta))
  rownames(print_df) <- ""
  print(print_df)
}
