#' @title resid.reg
#'
#' @param x A reg class object
#'
#' @returns Returns the beta-coefficients from the model as well as their standard errors and corresponding t- and p-values.
#' @export
#'
#' @examples
#' summary(linreg(Sepal.Length ~ Sepal.Width, iris))

summary.reg <- function(x){

  plot_df <- data.frame("Beta" = x$beta, "SE" = sqrt(diag(x$beta_var)), "t val" = x$t, "P(|T|>t)" = x$prob)
  colnames(plot_df)[3:4] <- c("t-val", "P(|T|>t)")
  print(plot_df)
  cat("\n")
  cat("Residual standard error:", sqrt(x$residvar), "on", x$df, "degrees of freedom")
}





