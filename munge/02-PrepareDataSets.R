# Fix the seed to have the same random number sequence for subsequent runs
set.seed(415)

# CustomerData should be auto loaded so select the features/independent variables from the Customerdata
columns_in_dataset <- ncol(CustomerData)
dataset <- CustomerData[,9:columns_in_dataset]

# create categorical values for the credit limit for logistic regression models
dataset$CreditLimitCategory <- factor(dataset$CreditLimit)
levels(dataset$CreditLimitCategory) <- make.names(levels(factor(dataset$CreditLimit)))

# split the dataset into training and test sets
trainIndex <- createDataPartition(dataset$CreditLimitCategory, p=0.80, list=FALSE)

dataset_train = dataset[trainIndex,]
dataset_test = dataset[-trainIndex,]
