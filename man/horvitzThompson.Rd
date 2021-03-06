% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/horvitzThompson.R
\name{horvitzThompson}
\alias{horvitzThompson}
\title{Compute the Horvitz-Thompson Estimator}
\usage{
horvitzThompson(
  y,
  pi = NULL,
  N = NULL,
  pi2 = NULL,
  var_est = FALSE,
  var_method = "LinHB",
  B = 1000
)
}
\arguments{
\item{y}{A numeric vector of the sampled response variable.}

\item{pi}{A numeric vector of inclusion probabilities for each sampled unit in y.  If NULL, then simple random sampling without replacement is assumed.}

\item{N}{A numeric value of the population size. If NULL, it is estimated with the sum of the inverse of the pis.}

\item{pi2}{A square matrix of the joint inclusion probabilities.  Needed for the "LinHT" variance estimator.}

\item{var_est}{A logical indicating whether or not to compute a variance estimator.  Default is FALSE.}

\item{var_method}{The method to use when computing the variance estimator.  Options are a Taylor linearized technique: "LinHB"= Hajek-Berger estimator, "LinHH" = Hansen-Hurwitz estimator, "LinHTSRS" = Horvitz-Thompson estimator under simple random sampling without replacement, and "LinHT" = Horvitz-Thompson estimator or a resampling technique: "bootstrapSRS" = bootstrap variance estimator under simple random sampling without replacement. The default is "LinHB".}

\item{B}{The number of bootstrap samples if computing the bootstrap variance estimator.  Default is 1000.}
}
\value{
List of output containing:
\itemize{
\item{pop_total:}{Estimate of population total}
\item{pop_mean:}{Estimate of population mean}
\item{pop_total_var:}{ Estimated variance of population total estimate}
\item{pop_mean_var:}{ Estimated variance of population mean estimate}
}
}
\description{
Calculate the Horvitz-Thompson Estimator for a finite population mean/proportion or total based on sample data collected from a complex sampling design.
}
\examples{
library(survey)
data(api)
horvitzThompson(y = apisrs$api00, pi = apisrs$pw^(-1))
horvitzThompson(y = apisrs$api00, pi = apisrs$pw^(-1), var_est = TRUE, var_method = "LinHTSRS")

}
\references{
{
\insertRef{hor52}{mase}
}
}
