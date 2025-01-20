#' Detect routes
#'
#' Determine if the routes slot is present in metadata
#' @param m_data A list containing eia metadata
#'
#' @return Logical
detect_routes <- function(m_data){
  return("routes" %in% names(m_data))
}
