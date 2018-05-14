# CSX415 Project: Assigning Credit Limits to New Accounts

## Overview

Purpose of this project is to examine if a model can be developed to assist jewelry manufacturers with assesing the credit risk of a potential new customer (retailer) and help the manufacturer assign a credit limit for this new customer.

## Project Files

This project uses ProjectTemplate and the project assets are stored acording to the ProjectTemplate folder structure.

Running the following commands will load and munge the necessary data to run the project and make a certain set of helper functions available for use. Each `.Rmd` file already calls the following two lines so this is not a requred step.

``` r
library('ProjectTemplate')
load.project()
```

Following documents will provide additional information about the project and the artifacts:

* ASSETS.md 
* /deploy/README.md
* /reports/README.md

## Installation

### Model Package

Final version of the model is packaged and can be used by simply installing the package.

``` r
# Install the released version from source (/pkgs)
install.packages("pkgs/CreditLimitModel", repos = NULL, type = "source")

# Or the development version from source using devtools:
# install.packages("devtools")
devtools::install("pkgs/CreditLimitModel")
```
After the installation, please refer to the Package help for further information

``` r
help(package="CreditLimitModel")
```
