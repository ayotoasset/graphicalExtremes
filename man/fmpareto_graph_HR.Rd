% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fitting_estimation_functions.R
\name{fmpareto_graph_HR}
\alias{fmpareto_graph_HR}
\title{Parameter fitting for multivariate Huesler--Reiss Pareto distributions on block graphs}
\usage{
fmpareto_graph_HR(data, graph, p = NULL, cens = FALSE,
  edges_to_add = NULL)
}
\arguments{
\item{data}{Numeric matrix of size \eqn{n\times d}{n x d}, where \eqn{n} is the
number of observations and \eqn{d} is the dimension.}

\item{graph}{Graph object from \code{igraph} package. The \code{graph} must be an undirected block graph, i.e., a decomposable, connected
graph with singleton separator sets.}

\item{p}{Numeric between 0 and 1 or \code{NULL}. If \code{NULL} (default),
it is assumed that the \code{data} are already on multivariate Pareto scale. Else,
\code{p} is used as the probability in the function \code{\link{data2mpareto}}
to standardize the \code{data}.}

\item{cens}{Logical. If true, then censored likelihood contributions are used for
components below the threshold. By default, \code{cens = FALSE}.}

\item{edges_to_add}{Numeric matrix \eqn{m\times 2}{m x 2}, where \eqn{m} is
the number of edges that are tried to be added in the greedy search.
By default, \code{edges_to_add = NULL}.}
}
\value{
List consisting of:
\itemize{
\item \code{graph}: Graph object from \code{igraph} package. If \code{edges_to_add} are provided,
then this is a list of the resulting graphs in each step of the greedy search.
\item \code{Gamma}: Numeric \eqn{d\times d}{d x d} estimated variogram matrix \eqn{\Gamma}.
If \code{edges_to_add} are provided,
then this is a list of the estimated variogram matrices in each step of the greedy search.
\item \code{AIC}: (only if \code{edges_to_add} are provided) List of AIC values of the fitted models
in each step of the greedy search.
\item \code{edges_added}: (only if \code{edges_to_add} are provided) Numeric matrix \eqn{m'\times 2}{m' x 2}, where
the \eqn{m'\leq m}{m'<=m} rows contain the edges that were added in the greedy search.
}
}
\description{
Fits the parameters of a multivariate Huesler--Reiss Pareto distribution using (censored) likelihood estimation.
Fitting is done separately on the cliques of the block graph. If  \code{edges_to_add}
are provided, then these edges are added in a greedy search to the original \code{graph},
such that in each step the likelihood is improved maximally and the new graph stays in the
class of block graphs. See \insertCite{eng2019;textual}{graphicalExtremes} for details.
}
\examples{
## Fitting a 4-dimensional HR distribution

my_graph <- igraph::graph_from_adjacency_matrix(
  rbind(c(0, 1, 0, 0),
        c(1, 0, 1, 1),
        c(0, 1, 0, 0),
        c(0, 1, 0, 0)),
  mode = "undirected")
n <- 100
Gamma_vec <- c(.5,1.4,.8)
complete_Gamma(Gamma = Gamma_vec, graph = my_graph)  ## full Gamma matrix
edges_to_add <- rbind(c(1,3), c(1,4), c(3,4))

set.seed(123)
my_data <- rmpareto_tree(n, "HR", tree = my_graph, par = Gamma_vec)
my_fit <- fmpareto_graph_HR(my_data, graph = my_graph,
  p = NULL, cens = FALSE, edges_to_add = edges_to_add)

}
\references{
\insertAllCited{}
}
