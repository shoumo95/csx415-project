#' Get the latest instance of the model for determining customer credit limits
#'
#' This function returns the most recent trained model for determining customer credit limits.
#' @param modelVersion By default the method returns the lates model.
#' @return This method will return a trainned model to be used in the predict() fucntion.
#' @export
#' @examples
#'
#' data("creditlimittestdata")
#' credit_limit_model <- getCreditModel()
#' predictions <- predict(credit_limit_model, newdata=dataset_test)
#'
getCreditModel <- function(modelVersion = "latest"){
  readRDS(system.file("extdata", "final_model.rds", package = "CreditLimitModel"))
}
