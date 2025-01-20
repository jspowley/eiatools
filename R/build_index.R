#' Build_Index
#'
#' The bread and butter of this package. Build Index lets you build a directory through recursive metadata and data calls, cataloging all endpoints and accessible tables.
#' @param sub a string containing the target subdirectory beneath https://api.eia.gov/v2/ (i.e. "petroleum/sum")
#' @param file_path a string with a .rds extension containing the destination path for the completed index, cached locally
#' @param api_key a string containing your eia api key
#'
#' @return NULL
#' @export
#'
#' @examples
build_index <- function(sub = "", file_path, api_key){

}
