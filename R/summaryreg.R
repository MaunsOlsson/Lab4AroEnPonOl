summary.reg <- function(x){

  plot_df <- data.frame("Beta" = x$beta, "SE" = sqrt(diag(x$beta_var)), "t val" = x$t, "P(|T|>t)" = x$prob)
  colnames(plot_df)[3:4] <- c("t-val", "P(|T|>t)")
  print(plot_df)
  cat("\n")
  cat("Residualspread:", x$residvar, "       df:", x$df)
}





