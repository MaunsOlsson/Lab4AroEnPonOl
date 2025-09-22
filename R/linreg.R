
linreg <- function(formula, data){
  if(class(formula) != "formula"){
    tryCatch(
      formula <- as.formula(formula),
      error = function(e){stop("Formula is neither a formula object or can be converted to a formula")},
      warning = function(w) {print("Your formula has problems with being converted to a formula")})
  } else {print("This is working")}



  x <- model.matrix(formula, data)
  y <- as.matrix(data[all.vars(formula)[1]])

  B <- solve(t(x) %*% x) %*% t(x) %*% y

  y.fitted <- x %*% B
}


test2 <- linreg("Sepal.Length ~ Sepal.Width", iris)

test <- formula(Sepal.Length ~ Sepal.Width)
