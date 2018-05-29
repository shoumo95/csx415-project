## Installation

There are several ways you can utilize the Credit Model; 

* Using the **Web Application**
* Using the **Command Line Interface**
* Installing the packaged model as a **library** and using it in your own code

### Prerequisites

* You will need R version 3.4.4 or above. You can download and install the R for your specific platfrom from CRAN  [here](https://cran.r-project.org/)
* You will also need RTools version 3.4 or above for Windows from CRAN [here](https://cran.r-project.org/bin/windows/Rtools/)

### Option 1 - Web Application (recommended)

#### Step 1
From your R command line, Install `packrat` if you already haven't done so.

``` r
install.packages("packrat")
```
#### Step 2
Copy the `csx415-app.tar.gz` file from the `/deploy` directory to the location where you want to install and open RStudio. For example, you can create a `Projects` directory under your `~/R` folder if one doesn't exist. In the R Console set your working directory to this location (or to another location which you would like to install the app).

```r
setwd("~/R/Projects")
```
and execute the following commands:

``` r
library("packrat")
packrat::unbundle("csx415-app.tar.gz", ".")
```
then set your working directory to the directory where the csx415-app is unbundled.

```r
setwd("~/R/Projects/csx415-app")
```

#### Step 3
You can run the web app from the R Console (Using RStudio or RGui) by typing the following command

``` r
source('runme_web.R')
```

or alternatively by:

* opening the `runme_web.R` file using RStudio, 
* selecting all lines (Ctrl-A), 
* and running them (Ctrl-Enter). 

This will execute the following lines on your R console: 

``` r
source("packrat/init.R")

library(plumber)
p <- plumb("plumber.R")
p$run(port=8000, swagger=FALSE)
```
You should see the following message after the last command executes:

```r
Starting server to listen on port 8000
```

#### Step 4
Open your browser and go to the address http://127.0.0.1:8000/home and follow the instructions from the main page to use the application.

#### Step 5
When you are finished, you can click on the stop icon to stop running the web server.

### Option 2 - Command Line Interface

#### Step 1 & 2
Follow Steps 1 and 2 from above if you haven't already done so.

#### Step 3
First, make sure you are able to run Rscript and you have the correct version of R installed. Type `Rscript --version` on the R command line in your terminal and you should see a result similart to this:

``` r
$ Rscript --version
  R scripting front-end version 3.4.4 (2018-03-15)
```
If you see the version and the date of the R script then go to the next step.

#### Step 4
Command line interface allows you to run the model by providing an input file and getting an output file with the scores appended to your input. We have provided a sample input data file called `NewCustomers.csv` which is located in the `/marketing` folder. So, try the following on your terminal:

``` r
$ Rscript runme_cli.R -i 'marketing/NewCustomers.csv' -o 'marketing/NewCustomerScores.csv'
```
Once the program finishes running, you can open the `NewCustomerScores.csv` file located in the `/marketing` folder using Excel or a text editor and examine the results!

### Option 3 - Model Package

Final version of the model is packaged and can be used by simply installing the package.

#### Step 1

Create a new folder under `~/R/Projects` called `csx415-model` as a simple test project folder.

#### Step 2

Copy the entire `pkgs` folder from the `csx415-project` into `csx415-model` folder (or wherever you have created your new directory).

#### Step 3

Open Rstudio and set your working directory to your new project folder

```r
setwd("~/R/Projects/csx415-model")
```

#### Step 4

``` r
# Install the released version from source (/pkgs)
install.packages("pkgs/CreditLimitModel", repos = NULL, type = "source")

# Or using devtools:
# install.packages("devtools")
devtools::install("pkgs/CreditLimitModel")
```
After the installation, please refer to the Package help for further information on how to use the library in your code.

``` r
help(package="CreditLimitModel")
```
#### Step 5
Create a new R script file and copy and paste the following content from below, and then run it.

```r
data("creditlimittestdata")
credit_limit_model <- getCreditModel()
predictions <- predict(credit_limit_model, newdata=dataset_test)
print(predictions)
```

## Installation - Project

If you are interested in the project and want to rebuild it using the source code, you can download it to your computer by clonning it using `git` or by downloading the `packrat` bundle.

### Using Git

```r
$ git clone https://github.com/hakanegeli/csx415-project.git
```

### Using Packrat

From your R command line, Install `packrat` if you already haven't done so.

``` r
install.packages("packrat")
```

Copy the `csx415-project.tar.gz` file from the `/deploy` directory to the location where you want to install and the open RStudio. In the Console set your working directory to this location and type the following commands:

``` r
library("packrat)
packrat::unbundle("csx415-project.tar.gz", ".")
```
