#' Download spatial data of Brazilian states
#'
#' @description
#' Data at scale 1:250,000, using Geodetic reference system "SIRGAS2000" and CRS(4674)
#'
#' @param year Numeric. Year of the data in YYYY format. Defaults to `2010`.
#' @param code_state The two-digit code of a state or a two-letter uppercase
#'                   abbreviation (e.g. 33 or "RJ"). If `code_state="all"` (the
#'                   default), the function downloads all states.
#' @template simplified
#' @template showProgress
#'
#'
#' @return An `"sf" "data.frame"` object
#'
#' @export
#' @family area functions
#'
#' @examplesIf identical(tolower(Sys.getenv("NOT_CRAN")), "true")
#' # Read specific state at a given year
#'   uf <- read_state(code_state=12, year=2017)
#'
#' # Read specific state at a given year
#'   uf <- read_state(code_state="SC", year=2000)
#'
#' # Read all states at a given year
#'   ufs <- read_state(code_state="all", year=2010)
#'
read_state <- function(code_state="all", year=2010, simplified=TRUE, showProgress=TRUE){

  # Get metadata with data url addresses
  temp_meta <- select_metadata(geography="state", year=year, simplified=simplified)

  # check if download failed
  if (is.null(temp_meta)) { return(invisible(NULL)) }


# BLOCK 2.1 From 1872 to 1991  ----------------------------
  x <- year

if( x < 1992){

#   if( !(substr(x = code_state, 1, 2) %in% temp_meta$code) &
#       !(substr(x = code_state, 1, 2) %in% temp_meta$code_abbrev) &
#       !(substr(x = code_state, 1, 3) %in% "all")) {
#       stop("Error: Invalid Value to argument code_state.")
#       }

  if(is.null(code_state)){ stop("Value to argument 'code_state' cannot be NULL")}

  if(code_state=="all"){

    # list paths of files to download
    file_url <- as.character(temp_meta$download_path)

    # download gpkg
    temp_sf <- download_gpkg(file_url, progress_bar = showProgress)

    # check if download failed
    if (is.null(temp_sf)) { return(invisible(NULL)) }

    return(temp_sf)

  } else if(nchar(code_state)==2){

    # list paths of files to download
    file_url <- as.character(temp_meta$download_path)

    # download gpkg
    temp_sf <- download_gpkg(file_url, progress_bar = showProgress)

    # check if download failed
    if (is.null(temp_sf)) { return(invisible(NULL)) }

    temp_sf <- subset(temp_sf,code_state==substr(code_state, 1, 2))
    return(temp_sf)
  }

}  else {


# BLOCK 2.2 From 2000 onwards  ----------------------------

  # Verify code_state input

  # if code_state=="all", read the entire country
    if(code_state=="all"){

      # list paths of files to download
      file_url <- as.character(temp_meta$download_path)

      # download gpkg
      temp_sf <- download_gpkg(file_url, progress_bar = showProgress)

      # check if download failed
      if (is.null(temp_sf)) { return(invisible(NULL)) }

      return(temp_sf)
    }

  if (!(substr(x = code_state, 1, 2) %in% temp_meta$code) & !(substr(x = code_state, 1, 2) %in% temp_meta$code_abbrev)) {
      stop("Error: Invalid Value to argument code_state.")

  } else{

    # list paths of files to download
    if (is.numeric(code_state)){ file_url <- as.character(subset(temp_meta, code==substr(code_state, 1, 2))$download_path) }
    if (is.character(code_state)){ file_url <- as.character(subset(temp_meta, code_abbrev==substr(code_state, 1, 2))$download_path) }


    # download gpkg
    temp_sf <- download_gpkg(file_url, progress_bar = showProgress)

    # check if download failed
    if (is.null(temp_sf)) { return(invisible(NULL)) }

    if(nchar(code_state)==2){
      return(temp_sf)

    # } else if(code_state %in% shape$code_state){
    #   x <- code_state
    #   shape <- subset(shape, code_state==x)
    #   return(shape)

    } else{
      stop("Error: Invalid Value to argument code_state.")
    }
  }
}}
