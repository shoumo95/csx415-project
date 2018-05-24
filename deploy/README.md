# CSX415 Project: Assigning Credit Limits to New Accounts

## Deployment

There are several deployment options that you can choose from; 

* Web Application
* Command Line Interface
* Installing the model as a library and using it directly in your own code

### Option 1 - Web Application (recommended)

#### Step 1
From your R command line, Install `packrat` if you already haven't done so.

``` r
install.packages("packrat)
```
#### Step 2
Copy the `csx415-app.tar.gz` file from the `/deploy` directory to the location where you want to install and open RStudio. In the Console set your working directory to this location.

```r
setwd("~/R/Projects"))
```
and execute the following commands:

``` r
library("packrat)
packrat::unbundle("csx415-app.tar.gz", ".")
```
then set your working directory to the directory where the csx415-app is unbundled.

```r
setwd("~/R/Projects/csx415-app"))
```

#### Step 3 - Using R Console
Now that all the libraries and the source files are unbundled, you can run the web app from the R commandline by opening the `runme_web.R` file, selecting all the lines (Ctrl-A), and running them (Ctrl-Enter). This will execute the following lines: 

``` r
source("packrat/init.R")

library(plumber)
p <- plumb("plumber.R")
p$run(port=8000, swagger=FALSE)
```
#### Step 3 (Alternative) - Using R Terminal
You can run the `runme_web.R` directly from an R Terminal instead of the R console.

First, make sure you are able to run Rscript and you have the correct version of R installed. Type `Rscript --version` on the command line in your terminal and you should see a result similart to this:

``` r
$ Rscript --version
  R scripting front-end version 3.4.4 (2018-03-15)
```
If you see the version of the R script you currently have, then type the following at the command prompt:

``` r
$ Rscript runme_web.R
  Starting server to listen on port 8000
```

#### Step 4
Open your browser and go to the address http://127.0.0.1:8000/home and follow the instructions from the main page.

### Option 2 - Command Line Interface

#### Step 1 & 2
Follow Steps 1 and 2 from above if you haven't already done so.

#### Step 3
First, make sure you are able to run Rscript and you have the correct version of R installed. Type `Rscript --version` on the command line in your terminal and you should see a result similart to this:

``` r
$ Rscript --version
  R scripting front-end version 3.4.4 (2018-03-15)
```
If you see the version and the date of the R scrip then go to the next step.

#### Step 4
Command line interface allows you to run the model by providing an input file and getting an output file with the scores appended to your input. We have provided a sample input data file called `NewCustomers.csv` which is located in the `/marketing` folder. So, try the following on your terminal:

``` r
$ Rscript runme_cli.R -i 'marketing/NewCustomers.csv' -o 'marketing/NewCustomerScores.csv'
```
Once the program finishes running, you can open the `NewCustomerScores.csv` file located in the `/marketing` folder using Excel or a text editor and examine the results!

### Command Line Interface (Advanced)

TODO add steps here for the NN model and setting up Python and Keras!

### Option 3 - Model Package

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

## Installation - Project

If you are interested in the project and want to rebuild it using the source code, you can download it to your computer by clonning it using `git` or by downloading the `packrat` bundle.

### Using Git

```r
$ git clone https://github.com/hakanegeli/csx415-project.git
```

### Using Packrat

From your R command line, Install `packrat` if you already haven't done so.

``` r
install.packages("packrat)
```

Copy the `csx415-project.tar.gz` file from the `/deploy` directory to the location where you want to install and the open RStudio. In the Console set your working directory to this location and type the following commands:

``` r
library("packrat)
packrat::unbundle("csx415-project.tar.gz", ".")
```
