#' Get the latest instance of the model for determining customer credit limits
#'
#' This function returns the most recent trained model for determining customer credit limits.
#' @param none method does not require an input
#' @return This method will return a trainned model to be used in the predict() fucntion
#' @export
#' @examples
#'
#' data("creditlimittestdata")
#' credit_limit_model <- getCreditModel()
#' predictions <- predict(credit_limit_model, newdata=dataset_test)
#'
getCreditModel <- function(){
  readRDS(system.file("extdata", "final_model.rds", package = "CreditLimitModel"))
}
