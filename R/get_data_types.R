#' get_data_types
#'
#' @param m_data A list with eia metadata
#'
#' @return A vector of data codes applicable to the eia api.
get_data_types <- function(m_data){
  return(names(m_data$data))
}
