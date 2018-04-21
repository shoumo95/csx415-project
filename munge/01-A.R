# Fix the seed to have the same random number sequence for subsequent runs
set.seed(415)

# CustomerData should be auto loaded so select the features/independent variables from the Customerdata
dataset <- CustomerData[,9:38]

# split the dataset into training and test sets
split = sample.split(dataset$CreditLimit, SplitRatio = 0.7)

dataset_train = subset(dataset, split == TRUE) 
dataset_test = subset(dataset, split == FALSE)
