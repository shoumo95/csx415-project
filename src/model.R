library('getopt')

#get options, using the spec as defined by the enclosed list.
#we read the options from the default: commandArgs(TRUE).
spec = matrix(c(
  'verbose', 'v', 2, "integer",
  'help'   , 'h', 0, "logical",
  'input'     , 'i', 1, "character",
  'output'    , 'o', 1, "character"
), byrow=TRUE, ncol=4)
opt = getopt(spec)

# if help was asked for print a friendly message
# and exit with a non-zero error code
if ( !is.null(opt$help) ) {
  cat(getopt(spec, usage=TRUE))
  q(status=1)
}

#set some reasonable defaults for the options that are needed,
#but were not specified.
if (is.null(opt$output)) { opt$output = 'predictions.csv' }
if (is.null(opt$verbose)) {opt$verbose = FALSE }

if (opt$verbose) { cat("Verbose mode is ON\n") }

cat("Output will be written to file ", opt$output)
cat("\n")

suppressPackageStartupMessages(require(caret))
suppressPackageStartupMessages(require(randomForest))
suppressPackageStartupMessages(library(CreditLimitModel))

if (is.null(opt$input)) { 
  data("creditlimittestdata")
} else {
  dataset_test <- read.csv(file=opt$input, header=TRUE, sep=",")
}

# getCreditModel() from the CreditLimitModel package returns the latest version of the model
model_loaded <- getCreditModel()

predictions <- predict(model_loaded, newdata=dataset_test)
cm <- confusionMatrix(data=table(predictions, dataset_test$CreditLimitCategory))
print(cm)

dataset_test$Predictions <- predictions

write.csv(dataset_test, file = opt$output, row.names = FALSE)

#signal success and exit.
#q(status=0);