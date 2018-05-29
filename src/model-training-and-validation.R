#plyr, reshape2, ggplot2, dplyr, tidyr, gridExtra, caret

suppressPackageStartupMessages(require(plyr))
suppressPackageStartupMessages(require(e1071))
suppressPackageStartupMessages(require(ggplot2))
suppressPackageStartupMessages(require(dplyr))
suppressPackageStartupMessages(require(tidyr))
suppressPackageStartupMessages(require(gridExtra))
suppressPackageStartupMessages(require(caret))
suppressPackageStartupMessages(require(randomForest))
suppressPackageStartupMessages(library(ROCR))
suppressPackageStartupMessages(library(Hmisc))

# for multinom and nnet methods
suppressPackageStartupMessages(library(nnet))


CustomerData <- read.csv(file="data/CustomerData.csv", header = TRUE, sep = ",")

source("munge/02-PrepareDataSets.R")

# optional parallelism to be used by caret's trainControl 
#suppressPackageStartupMessages(library(doParallel))
#cl <- makeCluster(detectCores())
#registerDoParallel(cl)

metric.create <- function(){
  setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("Accuracy", "AccuracySD", "Kappa", "KappaSD"))
}

metric.append <- function(df, model, row_name){
  df_tmp <- metric.create()
  df_tmp <- bind_rows(df_tmp, c(Accuracy=mean(model$resample[["Accuracy"]]),
                                AccuracySD=sd(model$resample[["Accuracy"]]),
                                Kappa=mean(model$resample[["Kappa"]]),
                                KappaSD=sd(model$resample[["Kappa"]])))
  rownames(df_tmp) <- c(row_name)
  rbind(df, df_tmp)
}

df <- metric.create()

control <- trainControl(method="repeatedcv", number=5, repeats=2, classProbs=TRUE, allowParallel=TRUE)


cat(as.character(Sys.time()), "-", "Training", "naive", "\n")
model_naive <- train(CreditLimitCategory ~ SalesLastYr, data=dataset_train, method="rpart", metric="Accuracy", trControl=control)
df <- metric.append(df, model_naive, "naive")


cat(as.character(Sys.time()), "-", "Training", "rpart", "\n")
model_rpart <- train(CreditLimitCategory ~ JBTRating + CreditLimitLocked + SalesCurrentYr + SalesLastYr + DesignBandSalesLast12Mo + NumberOfStoreLocations + AvgDaysOfPayCategory + ReturnedPaymentCount + RuralUrbanContinuumCode + MetroIndicator + MedianEarnings + MedianIncomeHouseholds - 1, data=dataset_train, method="rpart", metric="Accuracy", trControl=control)
df <- metric.append(df, model_rpart, "rpart")


cat(as.character(Sys.time()), "-", "Training", "rpart2", "\n")
model_rpart2 <- train(CreditLimitCategory ~ JBTRating + CreditLimitLocked + SalesCurrentYr + SalesLastYr + DesignBandSalesLast12Mo + NumberOfStoreLocations + AvgDaysOfPayCategory + ReturnedPaymentCount + RuralUrbanContinuumCode + MetroIndicator + MedianEarnings + MedianIncomeHouseholds - 1, data=dataset_train, method="rpart2", metric="Accuracy", trControl=control)
df <- metric.append(df, model_rpart2, "rpart2")


# commented out to shorten the time to evaluate models
# cat(as.character(Sys.time()), "-", "Training", "steplda", "\n")
# model_steplda <- train(CreditLimitCategory ~ JBTRating + CreditLimitLocked + SalesCurrentYr + SalesLastYr + DesignBandSalesLast12Mo + NumberOfStoreLocations + AvgDaysOfPayCategory + ReturnedPaymentCount + RuralUrbanContinuumCode + MetroIndicator + MedianEarnings + MedianIncomeHouseholds - 1, data=dataset_train, method="stepLDA", metric="Accuracy", trControl=control, trace=FALSE)
# df <- metric.append(df, model_steplda, "steplda")


cat(as.character(Sys.time()), "-", "Training", "svmLinear", "\n")
model_svmLinear <- train(CreditLimitCategory ~ JBTRating + CreditLimitLocked + SalesCurrentYr + SalesLastYr + DesignBandSalesLast12Mo + NumberOfStoreLocations + AvgDaysOfPayCategory + ReturnedPaymentCount + RuralUrbanContinuumCode + MetroIndicator + MedianEarnings + MedianIncomeHouseholds - 1, data=dataset_train, method="svmLinear", metric="Accuracy", trControl=control)
df <- metric.append(df, model_svmLinear, "svmLinear")

cat(as.character(Sys.time()), "-", "Training", "svmRad", "\n")
model_svmRad <- train(CreditLimitCategory ~ JBTRating + CreditLimitLocked + SalesCurrentYr + SalesLastYr + DesignBandSalesLast12Mo + NumberOfStoreLocations + AvgDaysOfPayCategory + ReturnedPaymentCount + RuralUrbanContinuumCode + MetroIndicator + MedianEarnings + MedianIncomeHouseholds - 1, data=dataset_train, method="svmRadial", metric="Accuracy", trControl=control)
df <- metric.append(df, model_svmRad, "svmRad")


cat(as.character(Sys.time()), "-", "Training", "svmPoly", "\n")
model_svmPoly <- train(CreditLimitCategory ~ JBTRating + CreditLimitLocked + SalesCurrentYr + SalesLastYr + DesignBandSalesLast12Mo + NumberOfStoreLocations + AvgDaysOfPayCategory + ReturnedPaymentCount + RuralUrbanContinuumCode + MetroIndicator + MedianEarnings + MedianIncomeHouseholds - 1, data=dataset_train, method="svmPoly", metric="Accuracy", trControl=control)
df <- metric.append(df, model_svmPoly, "svmPoly")


cat(as.character(Sys.time()), "-", "Training", "rf", "\n")
model_rf <- train(CreditLimitCategory ~ JBTRating + CreditLimitLocked + SalesCurrentYr + SalesLastYr + DesignBandSalesLast12Mo + NumberOfStoreLocations + AvgDaysOfPayCategory + ReturnedPaymentCount + RuralUrbanContinuumCode + MetroIndicator + MedianEarnings + MedianIncomeHouseholds - 1, data=dataset_train, method="rf", metric="Accuracy", trControl=control, tuneGrid=data.frame(.mtry=19))
df <- metric.append(df, model_rf, "rf")


cat(as.character(Sys.time()), "-", "Training", "multi", "\n")
model_multinom <- train(CreditLimitCategory ~ JBTRating + CreditLimitLocked + SalesCurrentYr + SalesLastYr + DesignBandSalesLast12Mo + NumberOfStoreLocations + AvgDaysOfPayCategory + ReturnedPaymentCount + RuralUrbanContinuumCode + MetroIndicator + MedianEarnings + MedianIncomeHouseholds - 1, data=dataset_train, method="multinom", metric="Accuracy", trControl=control, maxit=600, trace=FALSE)
df <- metric.append(df, model_multinom, "multi")


# commented out to shorten the time to evaluate models
# cat(as.character(Sys.time()), "-", "Training", "avNNet", "\n")
# model_avNNet <- train(CreditLimitCategory ~ JBTRating + CreditLimitLocked + SalesCurrentYr + SalesLastYr + DesignBandSalesLast12Mo + NumberOfStoreLocations + AvgDaysOfPayCategory + ReturnedPaymentCount + RuralUrbanContinuumCode + MetroIndicator + MedianEarnings + MedianIncomeHouseholds - 1, data=dataset_train, method="avNNet", metric="Accuracy", trControl=control, maxit=600, trace=FALSE)
# df <- metric.append(df, model_avNNet, "avNNet")


# commented out to shorten the time to evaluate models
# cat(as.character(Sys.time()), "-", "Training", "nnet", "\n")
# model_nnet <- train(CreditLimitCategory ~ JBTRating + CreditLimitLocked + SalesCurrentYr + SalesLastYr + DesignBandSalesLast12Mo + NumberOfStoreLocations + AvgDaysOfPayCategory + ReturnedPaymentCount + RuralUrbanContinuumCode + MetroIndicator + MedianEarnings + MedianIncomeHouseholds - 1, data=dataset_train, method="nnet", trControl=control, tuneGrid=data.frame(.size=20, .decay=1.0e-1), rang=0.1, maxit=10000, trace=FALSE)
# df <- metric.append(df, model_nnet, "nnet")

cat(as.character(Sys.time()), "-", "Training completed","\n")

cat("\n")
cat("Model Comparion","\n")
print(df[with(df, order(-Accuracy)),])

cat("\n")
cat("Best Model Details","\n")
print(get(paste("model", rownames(df[with(df, order(-Accuracy)),][1,]), sep="_")))

#stopCluster(cl)
