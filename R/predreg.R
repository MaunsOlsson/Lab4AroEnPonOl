pred <- function (model, new_data) UseMethod("predict")

predict.reg <- function(model, new_data == "no data"){

  if ($) {

  }
  #For model.matrix functionality with Y:
  y_names <- model$y_names
  y <- matrix(0, nrow(new_data), length(y_names))
  new_data <- cbind(y, new_data)
  names(new_data)[1:length(y_names)] <- y_names

  model.matrix(model2$formula, new_data) %*% model$beta

}



