#' get_all_freq
#'
#' @param m_data A list with eia metadata
#'
#' @return A vector of frequency codes applicable to the eia api.
get_all_freq <- function(m_data){
  return(m_data$frequency$id)
}
