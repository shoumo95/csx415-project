#' A Model for Determining Customer Credit Limits
#'
#' This function returns the most recent trained model for determining customer credit limits.
#' @keywords credit
#' @export
#' @examples
#' getCreditModel()
getCreditModel <- function(){
  readRDS(system.file("extdata", "final_model.rds", package = "CreditLimitModel"))
}
