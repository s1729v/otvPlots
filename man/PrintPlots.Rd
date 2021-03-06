% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_print.R
\name{PrintPlots}
\alias{PrintPlots}
\title{Create a pdf file with plots and compute summary statistics for all variables}
\usage{
PrintPlots(outFl, dataFl, sortVars, dateNm, dateGp, dateGpBp, weightNm = NULL,
  labelFl = NULL, genCSV = TRUE, highlightNms = NULL, skewOpt = NULL,
  kSample = 50000, fuzzyLabelFn = NULL, kCategories = 9)
}
\arguments{
\item{outFl}{Name of the output file, with no extension names (e.g., "bank"). 
A pdf file of plots ("bank.pdf"), and two csv files of summary statistics
("bank_categorical_summary.csv" and "bank_numerical_summary.csv") will be
saved to your working directory, unless a path is included in \code{outFl}
(e.g. "../plots/bank").}

\item{dataFl}{A \code{data.table} containing at least the following columns:
\code{myVar}, \code{weightNm}, \code{dateGp}, \code{dateGpBp}; usually an
output of the \code{\link{PrepData}} function.}

\item{sortVars}{A character vector of variable names in the order they will
be plotted.}

\item{dateNm}{Name of column containing the date variable.}

\item{dateGp}{Name of the variable that the time series plots should be 
grouped by. Options are \code{NULL}, \code{"weeks"}, \code{"months"}, 
\code{"quarters"}, \code{"years"}. See \code{\link[data.table]{IDate}} for
details. If \code{NULL}, then \code{dateNm} will be used as \code{dateGp}.}

\item{dateGpBp}{Name of variable the boxplots should be grouped by. Same
options as \code{dateGp}. If \code{NULL}, then \code{dateGp} will be used.}

\item{weightNm}{Name of the variable containing row weights, or \code{NULL} for 
no weights (all rows receiving weight 1).}

\item{labelFl}{A \code{data.table} containing variable labels, or \code{NULL}
for no labels; usually an output of \code{\link{PrepLabels}}.}

\item{genCSV}{Logical, whether to generate the two csv files of summary
statistics for numerical and categorical variables.}

\item{highlightNms}{Either \code{NULL} or a character vector of variables to
recieve red label. Currently \code{NULL} means all variables will get a 
black legend. Ignored this argument if \code{labelFl == NULL}.}

\item{skewOpt}{Either a numeric constant or \code{NULL}. Default is 
\code{NULL} (no transformation). If numeric, say 5, then all box plots of
a variable whose skewness exceeds 5 will be on a log10 scale if possible.
Negative input of \code{skewOpt} will be converted to 3.}

\item{kSample}{Either \code{NULL} or a positive integer. If an integer, 
indicates the sample size for both drawing boxplots and ordering numerical
graphs by \eqn{R^2}. When the data is large, setting \code{kSample} to a 
reasonable value (default is 50K) dramatically improves processing speed. 
Therefore, for larger datasets (e.g. > 10 percent system memory), this
parameter should not be set to \code{NULL}, or boxplots may take a very
long time to render. This setting has no impact on the accuracy of time 
series plots on quantiles, mean, SD, and missing and zero rates.}

\item{fuzzyLabelFn}{Either \code{NULL} or a function of 2 parameters: A label
file in the format of an output by \code{\link{PrepLabels}} and a string
giving a variable name. The function should return the label corresponding
to the variable given by the second parameter. This function should 
describe how fuzzy matching should be performed to find labels (see example
below). If \code{NULL}, only exact matches will be retuned.}

\item{kCategories}{If a categorical variable has more than \code{kCategories},
trace plots of only the \code{kCategories} most prevalent categories are
plotted.}
}
\value{
A pdf of plots saved to file \code{outFl}.pdf, and if the argument
  \code{genCSV == TRUE}, also two csv files of summary statistics for 
  numerical and categorical variables.
}
\description{
Creates plots and outputs results to a letter-sized pdf file, with each 
individual page containing plots on a single variable in the data. In 
addition, two summary statistics \code{data.table} are returned, one for
numerical variables, and one for categorical (and binary) ones.
}
\section{License}{

Copyright 2017 Capital One Services, LLC Licensed under the Apache License,
Version 2.0 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the  License at
http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law
or agreed to in writing, software distributed under the License is 
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY 
KIND, either express or implied. See the License for the specific language 
governing permissions and limitations under the License.
}

\seealso{
Functions depend on this function:
         \code{\link{vlm}}.

This function depends on:
         \code{\link{PlotVar}},
         \code{\link{PrepData}}.
}
