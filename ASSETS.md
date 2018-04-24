# DEPENDENCIES

library('ProjectTemplate')
For project organization and automation of several task (auto loading libraries and data munging)

library(ggplot2)
For charts and plotting

library(rpart)
For rpart function, Decision Tree modeling

library(rattle)
For enhanced Decision Tree plotting

library(caret)
For CrossValdation

library(gridExtra)
For grid.layout, in order to be able to plot charts side by side or by rows.

# INPUTS
/data/CustomerData.csv
This is the main data source for our project. This data get auto loaded by ProjectTemplate. 

/munge/01-A.R
ProjectTemplate runs the scripts in this file to pre-process the data loaded. It created two datasets, dataset_train and dataset_test.

/lib/helpers.R
This file contains our common helper functions that we use across .R and .Rmd files.

/project-performance.Rmd
Our initial Naive model

/project-performance-linear.Rmd
Our first iteartion of a linear model for our data

/project-performance-rpart.Rmd
Our first iteartion of a decision tree model for our data

# OUPUTS
/project-performance.html
Our Naive model results and report

/project-performance-linear.html
Our first linear model results and report

/project-performance-rpart.html
Our first decision tree model results and report
