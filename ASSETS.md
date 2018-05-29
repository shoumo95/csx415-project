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

## Formal Problem Statemet (FPS)

This Rmarkup file, `01-FPS.Rmd`, formats and knits the Formal Problem Statemet (FPS) and places an html file under the reports folder. For more about the FPS, please refer to the **Documents** section below.

## Collect and Shape Data

This Rmarkup file, `02-collect-and-shape.Rmd`, formats and knits the Collect and Shape Data process and places an html file under the reports folder. For more about the Collect and Shape Data, please refer to the **Documents** section below.

## Exploratory Data Analysis (EDA)

This Rmarkup file, `03-EDA.Rmd`, contains code to examine correlations between the variables which make up the dataset. The code uses `ggplot2` to graphically illustrate these relationships and the markdown knits the Exploratory Data Analysis report and places an html file under the reports folder. For more about the EDA, please refer to the **Documents** section below.

## Model Performance Evaluation

This  Rmarkup file, `model-performance-evaluation.Rmd`, builds the most basic and the simplest model, aka the Naive Model, for our problem. The markdown knits the Model Performance Evaluation report and places an html file under the reports folder. For more about the Model Performance Evaluation, please refer to the **Documents** section below.

## Feature Selection

This Rmarkup file, `04-feature-selection.Rmd`, contains code to examine which independent vaiables were the most significant solving the problem. The code uses linear model function `lm` and non-linear model function `rpart` to find the most significant coefficients and evaluates the "fitness" of the model based on the selected independent variables. The markdown knits the Feature Selection report and places an html file under the reports folder. For more about the Feature Selection, please refer to the **Documents** section below.

## Model Training and Validation

The Rmarkup file `05-training-and-validation.Rmd` takes the features that we have selected from the Feature Selection process and builds several Regression and also Classification models for comparison.

The program builds several classification models including:

* Decision Tree (**rpart** and **raprt2**),
* Linear Discriminant Analysis with Stepwise Feature Selection (**stepLDA**)**,
* Neural Networks Using Model Averaging (**avNNet**)** which uses different initialization paramters and averages out the results,
* Multinomial Log-linear Regression Model via Neural Networks (**multinom**),
* Random Forest (**rf**),
* Single-hidden-layer Neural Network (**nnet**)** with 20 nodes,
* Support Vector Machines with Linear Kernel (**svmLinear**)
* Support Vector Machines with Radial Basis Function Kernel (**svmRad**)
* Support Vector Machines with Polynomial Kernel (**svmPoly**)

** - We have commented these model out because of the time it takes to train them.

and performes a repeated K-fold cross-validation totaling 10 iterations (5 folds repeated twice) for each model. For each model Accuracy and Kappa values and the standard deviations for these performance metricies are also calculated and tabularized for comparison.

The program performs an analysis for the best two models and calculates a Confusion Metrix and ROC plots for each class for each of the top two models and selects the mest model for deployment.

The markdown knits the Model Training and Validation report and places an html file under the reports folder. For more about the Model Training and Validation, please refer to the **Documents** section below.

The R script file `model-training-and-validation.R` performs the same functions as the Rmarkdown version but this version does not depend on ProjectTemplate. As long as the required libraries are installed or available, this file can be executed from the R console and the output will be displayed on the console as well. Please refer to the `deploy/README.md` file for instruction on how to run it.

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