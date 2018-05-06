#' Credit Limit test dataset
#'
#' Dataset containing 340 test cases
#'
#' @format A data frame with columns:
#' \describe{
#'  \item{CreditLimit}{Credit limit}
#'  \item{CreditLimitLocked}{Indicator whether the credit limit is locked for prevent updates}
#'  \item{JBTRating}{Credit rating provided by JBT}
#'  \item{SalesCurrentYr}{Net sales for the current year}
#'  \item{SalesLastYr}{Net sales for the last year}
#'  \item{PlainBandSalesLast12Mo}{Net plain band sales for the last 12 months}
#'  \item{DesignBandSalesLast12Mo}{Net design band sales for the last 12 months}
#'  \item{DiamondBandSalesLast12Mo}{Net diamond band sales for the last 12 months}
#'  \item{AlternativeMetalSalesLast12Mo}{Net alternative metal band sales for the last 12 months}
#'  \item{TotalSalesLast12Mo}{Net total sales for the last 12 months}
#'  \item{BuyingGroupMember}{Indicates if the customer is a member of a buying group or not}
#'  \item{NumberOfStoreLocations}{Number of store locations for the customers}
#'  \item{AvgDaysOfPayCategory}{Customer's average days of pay classified as 0-10 days, 10-20 days, 20-30 days, 30-60 days, 60-90 days and 90 Plus days}
#'  \item{AvgDaysOfPay}{Numeric value representing the average days of pay for the customer}
#'  \item{MaxDaysPastDue}{Maximim number of days which the customer's account has been past due}
#'  \item{MaxAmtPastDue}{Maximum amount the customer's account has been past due}
#'  \item{AvgAmtPastDue}{Average amount  the customer's account has been past due}
#'  \item{ReturnedPaymentCount}{Number of times the customer's payments has been returned}
#'  \item{MaxReturnedPaymentAmt}{Maximum payment amount which was returned}
#'  \item{RuralUrbanContinuumCode}{Rural-Urban Continuum Codes form a classification scheme that distinguishes metropolitan counties by the population size of their metro area, and nonmetropolitan counties by degree of urbanization and adjacency to a metro area. The official Office of Management and Budget (OMB) metro and nonmetro categories have been subdivided into three metro and six nonmetro categories.}
#'  \item{UrbanInfluenceCode}{Urban Influence Codes form a classification scheme that distinguishes metropolitan counties by population size of their metro area, and nonmetropolitan counties by size of the largest city or town and proximity to metro and micropolitan areas.}
#'  \item{MetroIndicator}{Indicatior whether the customer is located at/near a metro area}
#'  \item{TotalPopulation}{Total population of the area where the customer is located}
#'  \item{MedianEarnings}{Median earnings of the area where the customer is located}
#'  \item{MedianRetailTradeEarnings}{Median Retail Earnings (NAICS Code 4483) of the area where the customer is located}
#'  \item{TotalHouseholds}{Number of households of the area where the customer is located}
#'  \item{MedianIncomeHouseholds}{Median income of individuals in the area where the customer is located}
#'  \item{NumberOfJewelryStores}{Number of Jewelry stores (NAICS Code 4483) in the area where the customer is located}
#'  \item{NumberOfJewelryStoresState}{Number of Jewelry stores (NAICS Code 4483) in the state where the customer is located}
#'  \item{JewelryStoreSalesState}{Total Sales for the Jewelry stores (NAICS Code 4483) in the state where the customer is located}
#'  \item{CreditLimitCategory}{Credit limit field converted to a factor type}
#' }
"dataset_test"
