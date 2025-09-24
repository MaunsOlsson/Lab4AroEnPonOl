#' @title summary.reg
#'
#' @param x A reg class object
#'
#' @returns Returns the beta-coefficients from the model as well as their standard errors and corresponding t- and p-values.
#' @exportS3Method base::summary
#'
#' @examples
#' summary(linreg(Sepal.Length ~ Sepal.Width, iris))

summary.reg <- function(x){
  plot_df <- data.frame("Beta" = x$beta, "SE" = sqrt(diag(x$beta_var)), "t val" = x$t, "P(|T|>t)" = x$prob)
  colnames(plot_df)[3:4] <- c("t-val", "P(|T|>t)")

  dots <- sapply(plot_df$`P(|T|>t)`, simplify = T, function(x){
    if(x <= 0.0001){"***"}
    else if(x <= 0.001){"**"}
    else if(x <= 0.01){"*"}
    else if(x <= 0.05){"."}
    else {" "}
  })

  plot_df <- cbind(plot_df, dots)
  colnames(plot_df)[5] <- ""
  print(plot_df)
  cat("\n")
  cat("Residual standard error:", sqrt(x$residvar), "on", x$df, "degrees of freedom")
}





