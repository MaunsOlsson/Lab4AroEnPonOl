#' @title linreg
#' @description
#' This function is an R implementation of least squares linear regression using the qr decomposition.
#'
#' @param formula A formula object describing how the designmatrix is supposed to look and what the variable of interest is.
#' @param data A dataframe where all columns included are numeric
#' @returns Returns a regressionobject that has special methods for plot, resid, pred, coef, summary
#' @export
#' @examples
#' linreg(Sepal.Length ~ Sepal.Width + Petal.Length, iris)
#'
#' linreg(DAX ~ SMI + CAC, EuStockMarkets)
#'
#'
#' @source Dijkstra's algorithm. (September, 2025). Retrieved from \href{https://en.wikipedia.org/wiki/QR_decomposition}{Wikipedia}.

reg <- setRefClass("reg", fields = list(beta = "matrix", fits = "matrix", e = "matrix",
                                              df = "numeric", residvar = "numeric",
                                              beta_var = "matrix", t = "matrix", prob = "matrix",
                                        formula = "formula", y_names = "character"))



linreg <- function(formula, data){
  if(class(formula) != "formula"){
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

  return(reg("beta" = beta, "fits" = fits, "e" = e, "df" = df, "residvar" = sigma2,
             "beta_var" = beta_var, "t" = t, "prob" = prob, "formula" = as.formula(formula), "y_names" =  y_names))

}

data(iris)
model <- lm(Sepal.Length ~ Sepal.Width + Petal.Length, iris)
model2 <- linreg(Sepal.Length ~ Sepal.Width + Petal.Length, iris)

print.reg <- function(x) { cat("din mamma")

}

print(model2)

library(microbenchmark)


X <- model.matrix(DAX ~ SMI + CAC, EuStockMarkets)
A <- t(X)%*%X

data("EuStockMarkets")

for (i in 1:25) {

  EuStockMarkets <- cbind(EuStockMarkets, rnorm(nrow(EuStockMarkets)))
}

testfun <- function() {
  X <- model.matrix(DAX ~ ., EuStockMarkets)
  A <- t(X)%*%X
  QR <- qr(X)
  solve(qr.R(QR), t(qr.Q(QR)) %*% EuStockMarkets[, 1])
}

noQR <- function(){
  X <- model.matrix(DAX ~ ., EuStockMarkets)
  A <- t(X)%*%X
  solve(A)%*%t(X)%*%EuStockMarkets[, 1]
}

microbenchmark(noQR, testfun, times = 10000)



