#' get routes
#' gets the routes dataframe from eia metadata
#' @param m_data list with eia metadata
#'
#' @return A dataframe
get_routes <- function(m_data){
  return(m_data$routes)
}
