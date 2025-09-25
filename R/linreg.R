#' @title linreg
#' @description
#' This function is an R implementation of least squares linear regression using the qr decomposition.
#'
#' @param formula A formula object describing how the designmatrix is supposed to look and what the variable of interest is.
#' @param data A dataframe where all columns included are numeric
#' @returns Returns a regressionobject that has special methods for plot, resid, print, pred, coef and summary
#' @importFrom stats as.formula model.matrix pt
#' @export
#' @examples
#' linreg(Sepal.Length ~ Sepal.Width + Petal.Length, iris)
#'
#' linreg(speed ~ dist, cars)
#'
#'
#' @source Bates, D. Matrix decompositions for regression analysis. Retrieved from \href{https://pages.stat.wisc.edu/~st849-1/lectures/Orthogonal.pdf}{Department of Statistics at University of Wisconsin–Madison}.



linreg <- function(formula, data){
  if(inherits(x = formula, what = "formula")){
    tryCatch(
      formula <- as.formula(formula),
      error = function(e){stop("Formula is neither a formula object or can be converted to a formula")},
      warning = function(w) {print("Your formula has problems with being converted to a formula")})
  } else {}


  variables <- all.vars(formula)

  # Vi vill att y är numerisk, men är X okej som strings?
  if (!is.numeric(data)) {

    for (i in variables) {
      if ( !is.numeric(data[[i]]) & !is.character(data[[i]]) ) {
        stop(cat("The variable ", i, " is not a numeric or a character."))
      }
    }
  }

  X <- model.matrix(formula, data)

  # Picks out y from the formula
  y_names <- variables[!(variables %in% colnames(X))]
  y <- data[[ y_names ]]

  if( !is.numeric( data[[variables[!(variables %in% colnames(X))]]] ) ){stop("The response has to be numeric.")}
  QR <- qr(X)
  R <- qr.R(QR)
  # Solving RBeta = Q^ty
  beta <- solve(R, t(qr.Q(QR)) %*% y )
  fits <- X%*%beta
  e <- y - fits
  df <- nrow(X) - ncol(X)
  sigma2 <- sum(e^2) / df
  beta_var <- sigma2 * solve(t(R)%*%R)
  t <- beta / sqrt(diag(beta_var))
  prob <- 2 * pt(t, df = df, lower.tail = FALSE)

  # Output changes ######
  output <- list(beta = beta, fits = fits, e = e,
                 df = df, residvar = sigma2,
                 beta_var = beta_var, t = t, prob = prob,
                 formula = formula, y_names = y_names, data = match.call())
  class(output) <- "reg"
  return(output)
}
