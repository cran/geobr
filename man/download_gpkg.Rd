% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{download_gpkg}
\alias{download_gpkg}
\title{Download geopackage to tempdir}
\usage{
download_gpkg(file_url, progress_bar = showProgress)
}
\arguments{
\item{file_url}{A string with the file_url address of a geobr dataset}

\item{progress_bar}{Logical. Defaults to (TRUE) display progress bar}
}
\description{
Download geopackage to tempdir
}
\seealso{
Other support functions: 
\code{\link{check_connection}()},
\code{\link{load_gpkg}()},
\code{\link{select_data_type}()},
\code{\link{select_metadata}()},
\code{\link{select_year_input}()}
}
\concept{support functions}
