print.reg <- function(x){
  cat("Coefficients:\n")
  print_df <- as.data.frame(t(x$beta))
  rownames(print_df) <- ""
  print(print_df)
}
