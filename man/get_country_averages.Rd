% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_country_averages.R
\name{get_country_averages}
\alias{get_country_averages}
\title{Get country averages}
\usage{
get_country_averages(rankings, drop_countries = TRUE,
  top_tier_only = TRUE)
}
\arguments{
\item{rankings}{Rankings created by \code{get_club_rankings}}

\item{drop_countries}{Drop countries that only made a tournament appearance,
but for which 538 does not track their primary league. Default is TRUE.}

\item{top_tier_only}{Show results for only the top tier. Default is TRUE.}
}
\value{
A data frame of country rankings
}
\description{
Get average rankings per country
}
\details{
Takes the rankings you create with \code{get_club_rankings} and gets
  country averages.
}
\examples{
library(five38clubrankings)
get_country_averages(rankings_2018)
}
