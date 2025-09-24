#' @title plot.reg
#'
#' @param x A reg class object
#'
#' @returns Returns a residual analysis which consists of two plots, fitted values vs residual and scale-location for each observation (fitted values vs standardized residual).
#' @export
#'
#' @examples plot(linreg(Sepal.Length ~ Sepal.Width, iris))


plot.reg <- function(x){
  requireNamespace("ggplot2", quietly = TRUE)
  resid <- x$e

  plot_df <- data.frame(e = resid, fits = x$fits, std_resid = resid / sqrt(x$residvar))
  print(ggplot2::ggplot(plot_df) + ggplot2::geom_point(ggplot2::aes(x = fits, y = e)) + ggplot2::labs(main = "Resid vs fits", y = "Residuals", x = "Fitted values") + ggplot2::theme_bw())
  print(ggplot2::ggplot(plot_df) + ggplot2::geom_point(ggplot2::aes(x = fits, y = sqrt(abs(std_resid)) )) + ggplot2::labs(main = "Scale-location", y = expression(sqrt("|Standardized residuals|")), x = "Fitted values") + ggplot2::theme_bw())
}

