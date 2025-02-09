% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_tree.R
\name{data_tree}
\alias{data_tree}
\title{Data Tree}
\usage{
data_tree(r_tree, api_key)
}
\arguments{
\item{r_tree}{A dataframe with routing paramters. Use route_tree or route_index.}

\item{api_key}{Your eia API key, as a string}
}
\value{
A dataframe of EIA's data heirarchy
}
\description{
Using a route tree dataframe, returns a data level heirarchy on recently updated eia data series
}
