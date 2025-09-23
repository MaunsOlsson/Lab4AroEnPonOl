# namespace, använd inte library!
library(ggplot2)

model2
x <- model2
model2

plot.reg <- function(x){

  resid <- x$e

  plot_df <- data.frame(e = resid, fits = x$fits, std_resid = resid / sqrt(x$residvar))
  ggplot(plot_df) + geom_point(aes(x = fits, y = e)) + labs(main = "Resid vs fits", y = "Residuals", x = "Fitted values") + theme_bw()
  ggplot(plot_df) + geom_point(aes(x = fits, y = sqrt(abs(std_resid)) )) + labs(main = "Scale-location", y = expression(sqrt("|Standardized residuals|")), x = "Fitted values") + theme_bw()

}

#https://en.wikipedia.org/wiki/Studentized_residual

plot(model2)

class(model)
View(plot.lm)

otype(model)
