#' @title plot.reg
#'
#' @param x A reg class object
#' @param ... Other arguments
#'
#' @returns Returns a residual analysis which consists of two plots, fitted values vs residual and scale-location for each observation (fitted values vs standardized residual).
#' @export plot.reg
#' @export
#' @import ggplot2
#'
#' @examples plot(linreg(Sepal.Length ~ Sepal.Width, iris))


plot.reg <- function(x, ...){
  requireNamespace("ggplot2", quietly = TRUE)
  resid <- x$e

  plot_df <- data.frame(e = resid, fits = x$fits, std_resid = resid / sqrt(x$residvar))
  print(ggplot(plot_df) + geom_point(aes(x = plot_df$fits, y = plot_df$e)) + labs(title = "Resid vs fits", y = "Residuals", x = "Fitted values") + theme_bw())
  print(ggplot(plot_df) + geom_point(aes(x = plot_df$fits, y = sqrt(abs(plot_df$std_resid)) )) + labs(title = "Scale-location", y = expression(sqrt("|Standardized residuals|")), x = "Fitted values") + theme_bw())
}

