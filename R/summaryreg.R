#' @title summary.reg
#' @description
#' Summarize an linear regression model from a custom made linear regression estimated with QR-decomposition.
#'
#' @param object A reg class object
#' @param ... Other arguments
#'
#' @returns Returns the beta-coefficients from the model as well as their standard errors and corresponding t- and p-values.
#' @export summary.reg
#' @export
#'
#' @examples
#' summary(linreg(Sepal.Length ~ Sepal.Width, iris))

summary.reg <- function(object, ...){

  plot_df <- data.frame("Beta" = object$beta, "SE" = sqrt(diag(object$beta_var)), "t val" = object$t, "P(|T|>t)" = object$prob)
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
  cat("Residual standard error:", sqrt(object$residvar), "on", object$df, "degrees of freedom")
}





