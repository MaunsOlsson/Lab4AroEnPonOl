#' @title linreg
#' @description
#' This function is an R implementation of least squares linear regression using the qr decomposition.
#'
#' @param formula A formula object describing how the designmatrix is supposed to look and what the variable of interest is.
#' @param data A dataframe where all columns included are numeric
#' @returns Returns a regressionobject that has special methods for plot, resid, pred, coef, summary
#' @export
#' @examples
#' dijkstra(wiki_graph, 1)
#'
#' dijkstra(wiki_graph, 3)
#'
#'
#' @source Dijkstra's algorithm. (September, 2025). Retrieved from \href{https://en.wikipedia.org/w/index.php?title=Dijkstra\%27s_algorithm&oldid=1306611316}{Wikipedia}.


linreg <- function(formula, data){
  if(class(formula) != "formula"){
    tryCatch(
      formula <- as.formula(formula),
      error = function(e){stop("Formula is neither a formula object or can be converted to a formula")},
      warning = function(w) {print("Your formula has problems with being converted to a formula")})
  } else {print("This is working")}


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
  y <- data[[ variables[!(variables %in% colnames(X))] ]]



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
  prob <- pt(t, df = df, lower.tail = FALSE)




}

data(iris)

model <- lm(Sepal.Length ~ Sepal.Width + Petal.Length, iris)


model2 <- linreg(Sepal.Length ~ Sepal.Width + Petal.Length, iris)


e <- 1:50000
microbenchmark(sum(e^2), t(e)%*%e, times = 10)

X <- model.matrix(Sepal.Length ~ Sepal.Width + Petal.Length, iris)
A <- t(X)%*%X
solve(A)


qr.coef(qr(X), iris$Sepal.Length)
solve(R%*%X, t(Q)%*%y)


qr(X)
qr.R(qr(X))

install.packages("microbenchmark")
library(microbenchmark)


X <- model.matrix(DAX ~ SMI + CAC, EuStockMarkets)
A <- t(X)%*%X

QR <- qr(X)
solve(qr.R(QR), t(qr.Q(QR)) %*% EuStockMarkets[, 1])
microbenchmark(solve(A)%*%t(X)%*%EuStockMarkets[, 1], solve(qr.R(QR), t(qr.Q(QR)) %*% EuStockMarkets[, 1]), times = 100)




test2 <- linreg("Sepal.Length ~ Sepal.Width", iris)

test <- formula(Sepal.Length ~ Sepal.Width)
