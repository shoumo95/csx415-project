data("creditlimittestdata")

# check to make sure data() is loading the test dataset
expect_true(exists("dataset_test"))

# check if the columns we need exist in the test dataset
expected_column_names <- c("CreditLimit",
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
                           "CreditLimitCategory")
expect_identical(colnames(dataset_test), expected_column_names)

# check the number of rows in the datase
expect_equal(nrow(dataset_test), 345)
