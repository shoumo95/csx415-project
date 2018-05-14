# CSX415 Project: Assigning Credit Limits to New Accounts

## Deployemnt

### RStudio

Copy the `my-pkg-proj-2018-05-12.tar.gz` file from the `/deploy` directory to the location where you want to install and the open RStudio. In the Console set your working directory to this location and type the following commands:

``` r
library('packrat')
packrat::unbundle("my-pkg-proj-2018-05-12.tar.gz", ".")
```

### Docker

Open a command prompt at the `/deploy/docker` folder and type the following command at the command prompt:

``` r

docker build -t csx415-credit-model .

```
Once the image is built you can type the following command to run the image where you will be placed at the root of the project:

``` r

docker run -ti --rm csx415-credit-model

```
When you are in the shell type the following command to run the model:

```r

Rscript "src/model.R" --help

```
You can pass the name and path of an input file with the **-i inputfile.csv** and specify the name and path of the output file with the **-o outputfile.csv** parameters.

