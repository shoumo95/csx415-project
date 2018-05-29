# DEPENDENCIES

## R
This project was developed using R version 3.4.4 and it has been tested on version 3.5.

## RTools
Some of the libraries require Rtools to be installed during their installation in Windows. You will need RTools 3.5 or above if you are using windows.

## Project Template
This project follows the organizational structure of [Project Template](http://projecttemplate.net/) and uses some of the automation functionality provided by the library, therefore you must install `projectTemplate` in order to be able to run the code (Rmarkdown documents). 

## Packrat
Deployable standalone application requires `packrat` for installation and this library must be installed in order to install the library dependencies.

## Packages
Full list of libraries and their dependencies can be fount in `packrat/packrat.lock` 

# DATA

## CustomerData.csv
This is the main data source for our project which is used to train and test the model(s), located in the `data` folder. This data gets auto loaded by ProjectTemplate.

This dataset conatins active customers who had a sales transaction both last year and the current year. Large retailers, online retailers, and wholesalers are removed from this dataset since the credit ratings and credit limits as well as risk assesments for these types of customers would be different than the regular relailers.

## ECN_2012_US_44A1_with_ann.csv
U.S. Census Bureau data set named **EC1244A1 - Retail Trade: Geographic Area Series: Summary Statistics for the U.S., States, Metro Areas, Counties, and Places: 2012**. This dataset contains information on Number of Establishments, Sales, and Annual Payroll for various NAICS codes on economic census geographies (CBSACode).

## CBSACodeUrbanInfluenceCode.csv
Mapping of the CBSA Codes to Urban Influence Codes. 

CBSA Code, core-based statistical area, is a U.S. geographic area defined by the Office of Management and Budget (OMB) that consists of one or more counties (or equivalents) anchored by an urban center of at least 10,000 people plus adjacent counties that are socioeconomically tied to the urban center by commuting.

Urban Influence Codes form a classification scheme that distinguishes metropolitan counties by population size of their metro area, and nonmetropolitan counties by size of the largest city or town and proximity to metro and micropolitan areas, subdivided into two metro and 10 nonmetro categories, resulting in a 12-part county classification.

## dataset_train and dataset_test
ProjectTemplate runs the scripts `01-AddlFeatures.R` and `02-PrepareDataSets.R` located in `munge` folder to pre-process the data loaded (CustomerData) and it creates two datasets, dataset_train and dataset_test, split by 80-20.

# CODE

## Collect and Shape Data

## Exploratory Data Analysis (EDA)

## Feature Selection

## Model Training and Validation

# DOCUMENTS

## Formal Problem Statemet (FPS)

This report contains detailed information about the problem, the project, project's scope, usage, stakeholders, success factors, risks, deployment options, project plan and cost estimate. Click [here](https://htmlpreview.github.com/?https://github.com/hakanegeli/csx415-project/blob/master/reports/01-FPS.html) to view the report 01-FPS.html.

## Collect and Shape Data

This report explains the main dataset for the development of the model, where it came from and what it contains and what steps were taken to prepre the data. The report also explains the auxilary data obtained from the Census.gov which was used to supplement the main dataset. Click [here](https://htmlpreview.github.com/?https://github.com/hakanegeli/csx415-project/blob/master/reports/02-collect-and-shape-data.html) to view the report 02-collect-and-shape-data.html.

## Exploratory Data Analysis (EDA)

This report explains the steps we took to analyze the data, understand the correlations between the features and how they relate to the dependent variable, the Credit Limit. Click [here](https://htmlpreview.github.com/?https://github.com/hakanegeli/csx415-project/blob/master/reports/03-EDA.html) to view the report 03-EDA.html.

## Model Performance Evaluation

This report examines the most basic and the simplest model, aka the Naive Model, which we can build for our problem. We will gauge the performance of the models we build against this baseline to track our progress. Click [here](https://htmlpreview.github.com/?https://github.com/hakanegeli/csx415-project/blob/master/reports/model-performance-evaluation.html) to view the report model-performance-evaluation.html.

## Feature Selection

This report explains the process we used to determine which independent vaiables were the most significant solving the problem and how we have evaluated each variable's contribution to the fitness of the model. Click [here](https://htmlpreview.github.com/?https://github.com/hakanegeli/csx415-project/blob/master/reports/04-feature-selection.html) to view the report 04-feature-selection.html.

## Model Training and Validation

This report explains various models that we have built to solve the problem, how we have trained and tested these models, and the performance evaluations of these models against the metric that we identified in our Formal Problem Statement document. Click [here](https://htmlpreview.github.com/?https://github.com/hakanegeli/csx415-project/blob/master/reports/05-training-and-validation.html) to view the report 05-training-and-validation.html, and the comparison of all the models that we have built, and the model we selected to deploy as a solution.