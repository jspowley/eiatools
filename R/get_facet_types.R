#' get_facet_types
#'
#' @param m_data A list with eia metadata
#'
#' @return A vector of facet codes applicable to the eia api.
get_facet_types <- function(m_data){
  return(m_data$facets$id)
}
