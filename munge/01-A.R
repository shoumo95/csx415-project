# Fix the seed to have the same random number sequence for subsequent runs
set.seed(415)


data <- ECN.2012.US.44A1.with.ann
data <- data[data$NAICS.id=="448310",]

data <- data.frame(lapply(data, as.character), stringsAsFactors=FALSE)
data$RCPTOT = as.numeric(data$RCPTOT)

data <- merge(data, CBSACodeUrbanInfluenceCode, by.x = "GEO.id2", by.y = "CBSACode", all.x = TRUE)


UrbanInfluenceCode_means <- data %>%
  group_by(UrbanInfluenceCode) %>%
  summarize(mean_RCPTOT = mean(RCPTOT, na.rm = TRUE))

missing_mean <- mean(data$RCPTOT[data$UrbanInfluenceCode>2], na.rm = T)

UrbanInfluenceCode_means <- CustomerData %>% select(UrbanInfluenceCode) %>% distinct() %>% arrange(UrbanInfluenceCode) %>%
  left_join(UrbanInfluenceCode_means, by="UrbanInfluenceCode", all.x = TRUE)

UrbanInfluenceCode_means$mean_RCPTOT[is.na(UrbanInfluenceCode_means$mean_RCPTOT)] <- missing_mean

merged <- merge(CustomerData, data[,c("GEO.id2", "RCPTOT")], by.x = "CBSACode", by.y = "GEO.id2", all.x = TRUE)

merged <- merge(merged, UrbanInfluenceCode_means, by = "UrbanInfluenceCode", all.x = TRUE)

merged$RCPTOT = ifelse(is.na(merged$RCPTOT), merged$mean_RCPTOT, merged$RCPTOT)

# we are done with the mean_RCPTOT column
merged$mean_RCPTOT <- NULL

column_names <- c("CustomerId",
                  "Zip",
                  "State",
                  "City",
                  "StateFIPS",
                  "CountyFIPS",
                  "CBSACode",
                  "CBSATitle",
                  "CreditLimit",
                  "CreditLimitLocked",
                  "JBTRating",
                  "SalesCurrentYr",
                  "SalesLastYr",
                  "PlainBandSalesLast12Mo",
                  "DesignBandSalesLast12Mo",
                  "DiamondBandSalesLast12Mo",
                  "AlternativeMetalSalesLast12Mo",
                  "TotalSalesLast12Mo",
                  "BuyingGroupMember",
                  "NumberOfStoreLocations",
                  "AvgDaysOfPayCategory",
                  "AvgDaysOfPay",
                  "MaxDaysPastDue",
                  "MaxAmtPastDue",
                  "AvgAmtPastDue",
                  "ReturnedPaymentCount",
                  "MaxReturnedPaymentAmt",
                  "RuralUrbanContinuumCode",
                  "UrbanInfluenceCode",
                  "MetroIndicator",
                  "TotalPopulation",
                  "MedianEarnings",
                  "MedianRetailTradeEarnings",
                  "TotalHouseholds",
                  "MedianIncomeHouseholds",
                  "NumberOfJewelryStores",
                  "NumberOfJewelryStoresState",
                  "JewelryStoreSalesState",
                  "RCPTOT")

CustomerData <- merged[,column_names]

# CustomerData should be auto loaded so select the features/independent variables from the Customerdata
dataset <- CustomerData[,9:39]

# create categorical values for the credit limit for logistic regression models
dataset$CreditLimitCategory <- factor(dataset$CreditLimit)
levels(dataset$CreditLimitCategory) <- make.names(levels(factor(dataset$CreditLimit)))

# split the dataset into training and test sets
trainIndex <- createDataPartition(dataset$CreditLimitCategory, p=0.80, list=FALSE)

dataset_train = dataset[trainIndex,]
dataset_test = dataset[-trainIndex,]
