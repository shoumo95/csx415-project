# plumber.R

suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(randomForest))
suppressPackageStartupMessages(library(caret))
suppressPackageStartupMessages(library(CreditLimitModel))

#* Save the csv file sent by the user
#* @post /fileupload
function(userdata){
  userdata <- gsub("\\|", "\n", userdata)
  
  fileConn <- file("userinput.csv")
  writeLines(userdata, fileConn)
  close(fileConn)
  
  input_data <- read.csv(file="userinput.csv", header=TRUE, sep=",")
  file.remove("userinput.csv")
  
  cat(as.character(Sys.time()),"-", "Upload Received\n")
  
  load("data/proto.Rda")
  input_data <- rbind(proto, input_data)
  
  model_loaded <- getCreditModel()
  predictions <- predict(model_loaded, newdata=input_data)
  
  cat(as.character(Sys.time()),"-", "Predictions Generated:\n")
  print(as.character(predictions))
  
  input_data$Predictions <- as.character(predictions)
  input_data
}

#' @serializer unboxedJSON
#' @post /getcreditlimit
function(state, 
         city, 
         salesThisYear, 
         salesLastYear, 
         designBandSalesLast12Mo, 
         numberOfStoreLocations, 
         jbtRating, 
         avgDaysOfPayCategory, 
         returnedPaymentCount, 
         creditLimitLocked,
         ruralUrbanContinuumCode,
         metroIndicator,
         medianEarnings,
         medianIncomeHouseholds){
  
  cat(as.character(Sys.time()),"-", 
      state, 
      city, 
      salesThisYear, 
      salesLastYear, 
      designBandSalesLast12Mo, 
      numberOfStoreLocations, 
      jbtRating, 
      avgDaysOfPayCategory, 
      returnedPaymentCount, 
      creditLimitLocked,
      ruralUrbanContinuumCode,
      metroIndicator,
      medianEarnings,
      medianIncomeHouseholds,
      "\n")
  
  load("data/proto.Rda")
  input_data <- rbind(proto, list(SalesCurrentYr=salesThisYear,
                                  SalesLastYr=salesLastYear,
                                  DesignBandSalesLast12Mo=designBandSalesLast12Mo,
                                  NumberOfStoreLocations=numberOfStoreLocations,
                                  JBTRating=jbtRating,
                                  AvgDaysOfPayCategory=avgDaysOfPayCategory,
                                  ReturnedPaymentCount=returnedPaymentCount,
                                  CreditLimitLocked=creditLimitLocked,
                                  RuralUrbanContinuumCode=ruralUrbanContinuumCode,
                                  MetroIndicator=metroIndicator,
                                  MedianEarnings=medianEarnings,
                                  MedianIncomeHouseholds=medianIncomeHouseholds))
  
  model_loaded <- getCreditModel()
  predictions <- predict(model_loaded, newdata=input_data)
  
  cat(as.character(Sys.time()),"-", "Prediction:", gsub("X", "",as.character(predictions)))
  
  list(creditLimit=gsub("X", "",as.character(predictions)))
}

#' @serializer unboxedJSON
#' @get /getcitiesandstates
function(){
  states_and_cities <- read.csv("data/CitiesAndStates.csv", as.is = TRUE)
  counties <- read.csv("data/Counties.csv", as.is = TRUE)
  census <- read.csv("data/Census.csv", as.is = TRUE)
  states_and_cities <- merge(states_and_cities, counties[, c("CountyFIPS", "RuralUrbanContinuumCode","UrbanInfluenceCode","MetroIndicator","CBSACode")], by.x = "CountyFIPS", by.y = "CountyFIPS", all.x = TRUE)
  states_and_cities <- merge(states_and_cities, census, by.x = "CBSACode", by.y = "CBSACode", all.x = TRUE)
  states_and_cities
}

#' @serializer unboxedJSON
#' @get /getjbtratings
function(){
  jbtRatings <- read.csv("data/JBTRatings.csv", as.is = TRUE)
  jbtRatings
}

#' @serializer unboxedJSON
#' @get /getavgdaysofpay
function(){
  avg_days_of_pay <- read.csv("data/AvgDaysOfPay.csv", as.is = TRUE)
  avg_days_of_pay
}

#' @get /home
#' @html
function(res){
  include_html("html/index.html", res)
}

#' @get /info
#' @html
function(res){
  include_html("html/info.html", res)
}

#' @get /data
#' @html
function(res){
  include_html("html/data.html", res)
}

#' @get /model
#' @html
function(res){
  include_html("html/model.html", res)
}

#' @get /fps
#' @html
function(res){
  include_html("html/01-FPS.html", res)
}

#' @get /eda
#' @html
function(res){
  include_html("html/03-EDA.html", res)
}

#' @get /trainingandvalidation
#' @html
function(res){
  include_html("html/05-training-and-validation.html", res)
}

#' @get /detdata
#' @json
function(){
  df <- read.csv("data/testdata.csv", header=TRUE)
  column_names <- c("Zip",
                    "State",
                    "City",
                    "CBSACode",
                    "CBSATitle",
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
                    "AvgDaysOfPayCategory")  
  df[,column_names]
}
