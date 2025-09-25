#' @title predict.reg
#'
#' @param model A reg class object
#' @param new_data a data.frame with character and numerical values. If no data.frame is given, the default to return is the fitted values for the training data.
#'
#' @returns Predicted values for the new_data.
#' @export predict.reg
#' @export
#' @importFrom stats predict
#'
#' @examples predict(linreg(Sepal.Length ~ Sepal.Width, iris[-c(1:5), ]), iris[1:5, ])

predict.reg <- function(model, new_data = FALSE){
  if (isFALSE(new_data)) {
    return(model$fits)
  }

  #For model.matrix functionality with Y:
  y_names <- model$y_names
  y <- matrix(0, nrow(new_data), length(y_names))
  new_data <- cbind(y, new_data)
  names(new_data)[1:length(y_names)] <- y_names

  model.matrix(model$formula, new_data) %*% model$beta
}


#' @title Alternative prediction function
#' @param object object that is used for the predictions
#' @param ... other arguments
#' See \code{\link[stats]{predict}} for details.
#' @export

pred <- function(object, ...){predict(object, ...)}
