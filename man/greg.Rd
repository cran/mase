% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GREG.R
\name{greg}
\alias{greg}
\title{Compute a generalized regression estimator}
\usage{
greg(
  y,
  xsample,
  xpop,
  pi = NULL,
  model = "linear",
  pi2 = NULL,
  var_est = FALSE,
  var_method = "LinHB",
  datatype = "raw",
  N = NULL,
  modelselect = FALSE,
  lambda = "lambda.min",
  B = 1000,
  fpc = TRUE,
  messages = TRUE
)
}
\arguments{
\item{y}{A numeric vector of the sampled response variable.}

\item{xsample}{A data frame of the auxiliary data in the sample.}

\item{xpop}{A data frame of population level auxiliary information.  It must contain the same names as xsample.  If datatype = "raw", must contain unit level data.  If datatype = "totals" or "means", then contains one row of aggregated, population totals or means for the auxiliary data. Default is "raw".}

\item{pi}{A numeric vector of inclusion probabilities for each sampled unit in y.  If NULL, then simple random sampling without replacement is assumed.}

\item{model}{A string that specifies the regression model to utilize. Options are "linear" or "logistic".}

\item{pi2}{A square matrix of the joint inclusion probabilities.  Needed for the "LinHT" variance estimator.}

\item{var_est}{A logical indicating whether or not to compute a variance estimator.  Default is FALSE.}

\item{var_method}{The method to use when computing the variance estimator.  Options are a Taylor linearized technique: "LinHB"= Hajek-Berger estimator, "LinHH" = Hansen-Hurwitz estimator, "LinHTSRS" = Horvitz-Thompson estimator under simple random sampling without replacement, and "LinHT" = Horvitz-Thompson estimator or a resampling technique: "bootstrapSRS" = bootstrap variance estimator under simple random sampling without replacement. The default is "LinHB".}

\item{datatype}{A string that specifies the form of population auxiliary data. The possible values are "raw", "totals" or "means" for whether the user is providing population data at the unit level, aggregated to totals, or aggregated to means.  Default is "raw".}

\item{N}{A numeric value of the population size. If NULL, it is estimated with the sum of the inverse of the pis.}

\item{modelselect}{A logical for whether or not to run lasso regression first and then fit the model using only the predictors with non-zero lasso coefficients. Default is FALSE.}

\item{lambda}{A string specifying how to tune the lasso hyper-parameter.  Only used if modelselect = TRUE and defaults to "lambda.min". The possible values are "lambda.min", which is the lambda value associated with the minimum cross validation error or "lambda.1se", which is the lambda value associated with a cross validation error that is one standard error away from the minimum, resulting in a smaller model.}

\item{B}{The number of bootstrap samples if computing the bootstrap variance estimator.  Default is 1000.}

\item{fpc}{Default to TRUE, logical for whether or not the variance calculation should include a finite population correction when calculating the "LinHTSRS" or the "SRSbootstrap" variance estimator.}

\item{messages}{A logical indicating whether to output the messages internal to mase. Default is TRUE.}
}
\value{
A list of output containing:

* pop_total: Estimate of population total.

* pop_mean: Estimate of the population mean (or proportion).

* weights: Survey weights produced by GREG (linear model only).

* pop_total_var: Estimated variance of population total estimate.

* pop_mean_var: Estimated variance of population mean estimate.
}
\description{
Calculates a generalized regression estimator for a finite population mean/proportion or total based on sample data collected from a complex sampling design and auxiliary population data.
}
\examples{
library(dplyr)
data(IdahoPop)
data(IdahoSamp)

xsample <- filter(IdahoSamp, COUNTYFIPS == "16055")
xpop <- filter(IdahoPop, COUNTYFIPS == "16055")

greg(y = xsample$BA_TPA_ADJ,
     N = xpop$npixels,
     xsample = xsample[c("tcc", "elev")],
     xpop = xpop[c("tcc", "elev")],
     var_est = TRUE,
     var_method = "LinHB",
     datatype = "means")

}
\references{
\insertRef{cas76}{mase}

\insertRef{sar92}{mase}
}
