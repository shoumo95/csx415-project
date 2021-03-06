% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getCreditModel.R
\name{getCreditModel}
\alias{getCreditModel}
\title{Get the latest instance of the model for determining customer credit limits}
\usage{
getCreditModel(modelVersion = "latest")
}
\arguments{
\item{modelVersion}{By default the method returns the lates model.}
}
\value{
This method will return a trainned model to be used in the predict() fucntion.
}
\description{
This function returns the most recent trained model for determining customer credit limits.
}
\examples{

data("creditlimittestdata")
credit_limit_model <- getCreditModel()
predictions <- predict(credit_limit_model, newdata=dataset_test)

}
