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

Create a new folder under `~/R/Projects` called `csx415-model`. This is where we will copy the model source and create an R script file as our test application which will use the CreditLimitModel library.

#### Step 2

Copy the entire `pkgs` folder from the `csx415-project` into the `csx415-model` folder (or wherever you have created your new directory).

#### Step 3

Open Rstudio and set your working directory to your new project folder.

```r
setwd("~/R/Projects/csx415-model")
```

#### Step 4

Install the package.

``` r
# Install the released version from source (/pkgs)
install.packages("pkgs/CreditLimitModel", repos = NULL, type = "source")

# Or using devtools:
# install.packages("devtools")
devtools::install("pkgs/CreditLimitModel")
# or from github if you do not have the CreditLimitModel source locally under the pkgs folder
# devtools::install_github("hakanegeli/csx415-project/pkgs/CreditLimitModel")
```
After the installation, please refer to the Package help for further information on how to use the library in your code.

``` r
help(package="CreditLimitModel")
```
#### Step 5
Create a new R script file, copy and paste the following content from below, and then run it.

```r
data("creditlimittestdata")
credit_limit_model <- getCreditModel()
predictions <- predict(credit_limit_model, newdata=dataset_test)
print(predictions)
```

## Installation - Project

If you are interested in the project and want to rebuild it using the source code, you can download it to your computer by clonning it using `git` or by downloading the `packrat` bundle.

### Using Git

#### Step 1

Our project uses ProjectTemplate so we have to first create a blank project so that we can copy our code into it. Open RStudio and set your working directory to your `~/R/Projects` folder. You may have to create the `Projects` folder first if one does not exist under your `~/R` directory.

```r
setwd("~/R/Projects")
```
Then we will need to create a blank project with our project name:

```r
#install ProjectTemplate if you haven't already done so
#install.packages("ProjectTemplate")

library("ProjectTemplate")
create.project("csx415-project", template = "minimal")
```
Now, completely exit out of RStudio!

#### Step 2

Open up a Git Bash and change your directory to the `csx415-project` folder which should be located at `~/R/Projects/csx415-project` in your system. When you are in the `csx415-project` folder, type (or copy paste) the following commands one at a time at the $ prompt:

```r
$ git init
$ git remote add origin https://github.com/hakanegeli/csx415-project.git
$ git fetch
$ git branch master origin/master
$ git checkout -f master
$ git add -A
$ git commit -m "my eval commit"
```
#### Step 3

Open RStudio and set your working directory to the project folder.

```r
setwd("~/R/Projects/csx415-project")
```
Now we need to restore the libraries we need using packrat. Type the following commands at the R Console:

```r
#install packrat if you haven't already done so
#install.packages("packrat")

source("packrat/init.R")
packrat::restore()
```
If packrat successfully restored the libraries, we strongly suggest you exit out of RStudio (not just Restart R) and open RStudio again. Then set your working directory to the project folder and run the following command so that all the required libraries are available to the project: 

```r
setwd("~/R/Projects/csx415-project")
source("packrat/init.R")
```
All the source files (.R and .Rmd) are located under the `src` folder. You can check out the ASSETS.md file to lear more about each of the source files and what they contain!


### Using Packrat

Using this approach, you can have access to all the source files and the reports but you can only run the .R files under the `src` folder since this is not a properly initialized ProjectTemplate project. However, at the end of the installation, you should be able to run the model-training-and-validation.R file!

#### Step 1

Download the `csx415-project.tar.gz` file from the `/deploy` directory in GitHub to the location where you want to install, for example `~/R/Projects` folder. You may have to create the `Projects` folder first if one does not exist under your `~/R` directory. Open RStudio and in the R Console set your working directory to this location and type the following commands:

``` r
setwd("~/R/Projects")

#install packrat if you haven't already done so
#install.packages("packrat")

library("packrat)
packrat::unbundle("csx415-project.tar.gz", ".")
```
#### Step 2

Set your working directory to the project folder and run the following command so that all the required libraries are available to the project:

```r
setwd("~/R/Projects/csx415-project")
source("packrat/init.R")
```
#### Step 3

Run the `model-training-and-validation.R` file:

```r
source("src/model-training-and-validation.R")
```
You should see console logs as the model training runs and a summary of the evaluation at the end of the run.
