#' Build_Index
#'
#' Intended for use after a metadata tree has been created using route_tree(). Not currently implemented
#' @param sub a string containing the target subdirectory beneath https://api.eia.gov/v2/ (i.e. "petroleum/sum")
#' @param file_path a string with a .rds extension containing the destination path for the completed index, cached locally
#' @param api_key a string containing your eia api key
#'
#' @return NULL
#' @export
build_index <- function(sub = "", file_path, api_key){
  m_data <- eia_meta(sub, api_key)
}
