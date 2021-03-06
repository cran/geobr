#' Download spatial data of official metropolitan areas in Brazil
#'
#' @description
#' The function returns the shapes of municipalities grouped by their respective
#' metro areas. Metropolitan areas are created by each state in Brazil. The data
#' set includes the municipalities that belong to all metropolitan areas in the
#' country according to state legislation in each year. Original data were
#' generated by Institute of Geography. Data at scale 1:250,000, using Geodetic
#' reference system "SIRGAS2000" and CRS(4674).
#'
#' @param year A year number in YYYY format. Defaults to `2018`
#' @param simplified Logic `FALSE` or `TRUE`, indicating whether the function
#' returns the data set with original' resolution or a data set with 'simplified'
#' borders. Defaults to `TRUE`. For spatial analysis and statistics users should
#' set `simplified = FALSE`. Borders have been simplified by removing vertices of
#' borders using `sf::st_simplify()` preserving topology with a `dTolerance` of 100.
#' @param showProgress Logical. Defaults to `TRUE` display progress bar
#'
#' @return An `"sf" "data.frame"` object
#'
#' @export
#' @examples \dontrun{ if (interactive()) {
#' # Read all official metropolitan areas for a given year
#'   m <- read_metro_area(2005)
#'
#'   m <- read_metro_area(2018)
#' }}
read_metro_area <- function(year=2018, simplified=TRUE, showProgress=TRUE){

  # Get metadata with data url addresses
  temp_meta <- select_metadata(geography="metropolitan_area", year=year, simplified=simplified)

  # list paths of files to download
  file_url <- as.character(temp_meta$download_path)

  # download files
  temp_sf <- download_gpkg(file_url, progress_bar = showProgress)
  return(temp_sf)
}
