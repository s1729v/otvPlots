# Installation

```
Sys.setenv(https_proxy="https://EID:SSO@proxy.kdc.capitalone.com:8099")
Sys.setenv(http_proxy="https://EID:SSO@proxy.kdc.capitalone.com:8099")
# On AWS, I found I had the most success with the Iowa State CRAN repo
# This isn't necessary on local, and results may vary on statgw
options(repos = "https://mirror.las.iastate.edu/CRAN/")
install.packages("devtools")
devtools::install_github("sju922/Velma", host="github.kdc.capitalone.com/api/v3")
```

You can also download the latest build from the issues page, or build the package yourself by cloning the repo, setting your working directory to the otvPlots folder and running `devtools::build() `. 

Note that otvPlots does depend on R and several R packages to run. You can see a complete and up to date list of dependencies in the DESCRIPTION file in the otvPlots branch. 

## R package for variable level monitoring

An important part of model building is the "proc eyeball" sanity check. It can also be a painful part of the process, when you are the data scientist tasked with creating and checking 10,000 or more near-identical plots. Velma is designed to streamline this process. Velma is an R function which takes a flat file as input and provides a pdf of VLM plots as output, optionally ordered so that any severely abnormal time series will be at the top of the pdf. The only strict requirement of the data scientist is to specify which column of the flat file contains the date variable. 

Velma is efficiently implemented using data.table and ggplot2. Plots are automatically labeled if a variable dictionary is provided. Important variables can be given a highlighted label. A custom fuzzy matching algorithm can be provided by the user. 

Discrete and numeric variables are handled automatically and given separate treatment. Plots are customized for credit-type variables such as DMS attributes. 

#### Here is an example of a numeric plot 
<img src="https://github.kdc.capitalone.com/sju922/Velma/blob/master/vignettes/Figs/fig-1.png" 
     alt="numeric plot" 
   width="1285" 
   height="700">


#### Here is an example of a discrete plot 
<img src="https://github.kdc.capitalone.com/sju922/Velma/blob/master/vignettes/Figs/fig-2.png" 
     alt="discrete plot" 
   width="1285" 
   height="700">


## Installation on statgw 

Use of statgw for R development is not recommended. AWS or local R will be more stable. If you must, follow the tips [here](https://github.kdc.capitalone.com/FSGalaxyVulcan/Infrastructure/wiki/R-on-the-server) to fix some known issues with the statgw server.


# Getting started

### Velma is extensively documented using R's man pages, so please check out the documentation to see all of the options and many additional usage examples

```
library(otvPlots)
?PlotWrapper
```

## Test it's working
```
example(PlotVar)
```

## Simple usage example
```

 data(bankData);  setDT(bankData)
 data(bankLabels);  setDT(bankLabels)
 
 PlotWrapper(
   dataFl   = bankData, 
   labelFl  = bankLabels, 
   dateNm   = "date", 
   dateGp   = "months", 
   dateGpBp = "quarters", 
   outFl    = "bank.pdf", 
   sortFn   = "OrderByR2",
   prepData = TRUE
   )

```

