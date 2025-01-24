#' get_facet_data
#'
#' @param sub a string
#' @param facet_id a string
#' @param api_key your eia api key
#'
#' @return A dataframe
#' @export
get_facet_data <- function(sub, facet_id, api_key){
  f_data <- eia_meta(sub = paste0(sub,"/facet/", facet_id), api_key = api_key)
  print(str(f_data$facets))
  return(f_data$facets)
}
