# dataset ECN.2012.US.44A1.with.ann (Census data for Retail Trade: Geographic Area Series: Summary Statistics for the U.S., States, Metro Areas, Counties, and Places) 
# contains the annual sales information (RCPTOT) for various NAICS. NAICS code 448310 is specific to Jewelry Stores
data <- ECN.2012.US.44A1.with.ann
data <- data[data$NAICS.id=="448310",]

# RCPTOT values for some of the statistical areas are masked with the letter D for privacy reasons. We need to take care of these missing values
# These values are automatically loaded as factors. We need to convert them to numbers and assign NAs for the "D" values (as.numeric automatically assigns NAs)
data <- data.frame(lapply(data, as.character), stringsAsFactors=FALSE)
data$RCPTOT = as.numeric(data$RCPTOT)

# missing store sales values can be replaced by an average for this field. However, average within each Urban Influence Code would be a better substitution for the missing values
# using the CBSACodeUrbanInfluenceCode dataset which translates CBSACodes to Urban Influence Codes we can now take advantage of the Urban Influence Code to determine our means
data <- merge(data, CBSACodeUrbanInfluenceCode, by.x = "GEO.id2", by.y = "CBSACode", all.x = TRUE)

# calculate the means for each of the Urban Influence Codes
UrbanInfluenceCode_means <- data %>%
  group_by(UrbanInfluenceCode) %>%
  summarise(mean_RCPTOT = mean(RCPTOT, na.rm = TRUE))

UrbanInfluenceCode_means_start <- UrbanInfluenceCode_means

# however, there are some urban influence codes which has no data at all. These are primarily non-urban areas. We will determine a non-urban mean and assign this mean to the other missing urban influence codes
missing_mean <- mean(data$RCPTOT[data$UrbanInfluenceCode>2], na.rm = T)

# prepare a full list of Urban Influence codes and means for these codes
CustomerData$RCPTOT <- NULL 
UrbanInfluenceCode_means <- CustomerData %>% select(UrbanInfluenceCode) %>% distinct() %>% arrange(UrbanInfluenceCode) %>%
  left_join(UrbanInfluenceCode_means, by="UrbanInfluenceCode", all.x = TRUE)

# and also set the missing_mean to the urband influence codes with NA values
UrbanInfluenceCode_means$mean_RCPTOT[is.na(UrbanInfluenceCode_means$mean_RCPTOT)] <- missing_mean

merged <- NULL

# add the RCPTOT field to the CustomerData dataset using a left join
merged <- merge(CustomerData, data[,c("GEO.id2", "RCPTOT")], by.x = "CBSACode", by.y = "GEO.id2", all.x = TRUE)

# and bring the UrbanInfluenceCode_means to the merged dataset so that we can use these means to substitute the missing RCPTOT
merged <- merged %>% left_join(UrbanInfluenceCode_means, by="UrbanInfluenceCode", all.x = TRUE)

# if RCPTOT is NA use the UrbanInfluenceCode_means, else keep it
merged$RCPTOT = ifelse(is.na(merged$RCPTOT), merged$mean_RCPTOT, merged$RCPTOT)

# we are done with the mean_RCPTOT column, remove it
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

# assign all the columns plus the new RCPTOT column back to the Customer Data
CustomerData <- merged[,column_names]

# cleanup!
merged <- NULL
#UrbanInfluenceCode_means <- NULL