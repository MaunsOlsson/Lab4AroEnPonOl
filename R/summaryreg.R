summary.reg <- function(x){
  x$e

  data.frame("Beta" = x$beta, "Standard error" = sqrt(diag(x$beta_var)), "t val" = x$t, "P(T>t)")


}

summary(model)



