% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transformation_functions.R
\name{chi2Gamma}
\alias{chi2Gamma}
\title{Transformation of extremal correlation \eqn{\chi} to the Huesler--Reiss variogram \eqn{\Gamma}}
\usage{
chi2Gamma(chi)
}
\arguments{
\item{chi}{Numeric or matrix, with entries
between 0 and 1.}
}
\value{
Numeric or matrix. The \eqn{\Gamma} parameters in the Huesler--Reiss
distribution.
}
\description{
Transforms the extremal correlation \eqn{\chi} into the \code{Gamma} matrix
from the definition of a Huesler--Reiss
distribution.
}
\details{
The formula for transformation from \code{chi} to \eqn{\Gamma} that is applied element-wise is
\deqn{\Gamma = (2 \Phi^{-1}(1 - 0.5 \chi))^2,}
where \eqn{\Phi^{-1}} is the inverse of the standard normal distribution function.
This is the inverse of \code{\link{Gamma2chi}}.
}
