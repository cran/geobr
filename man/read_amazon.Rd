% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_amazon.R
\name{read_amazon}
\alias{read_amazon}
\title{Download spatial data of Brazil's Legal Amazon}
\usage{
read_amazon(year = 2012, simplified = TRUE, showProgress = TRUE)
}
\arguments{
\item{year}{A date number in YYYY format. Defaults to \code{2012}}

\item{simplified}{Logic \code{FALSE} or \code{TRUE}, indicating whether the function
returns the data set with original' resolution or a data set with 'simplified'
borders. Defaults to \code{TRUE}. For spatial analysis and statistics users should
set \code{simplified = FALSE}. Borders have been simplified by removing vertices of
borders using \code{sf::st_simplify()} preserving topology with a \code{dTolerance} of 100.}

\item{showProgress}{Logical. Defaults to \code{TRUE} display progress bar}
}
\value{
An \verb{"sf" "data.frame"} object
}
\description{
This data set covers the whole of Brazil's Legal Amazon as defined in the
federal law n. 12.651/2012). The original data comes from the Brazilian
Ministry of Environment (MMA) and can be found at "http://mapas.mma.gov.br/i3geo/datadownload.htm".
}
\examples{
\dontrun{ if (interactive()) {
# Read Brazilian Legal Amazon
a <- read_amazon(year = 2012)
}}
}
\seealso{
Other general area functions: 
\code{\link{read_biomes}()},
\code{\link{read_census_tract}()},
\code{\link{read_comparable_areas}()},
\code{\link{read_conservation_units}()},
\code{\link{read_country}()},
\code{\link{read_health_region}()},
\code{\link{read_immediate_region}()},
\code{\link{read_intermediate_region}()},
\code{\link{read_meso_region}()},
\code{\link{read_micro_region}()},
\code{\link{read_municipality}()},
\code{\link{read_neighborhood}()},
\code{\link{read_region}()},
\code{\link{read_semiarid}()},
\code{\link{read_state}()},
\code{\link{read_statistical_grid}()},
\code{\link{read_weighting_area}()}
}
\concept{general area functions}
