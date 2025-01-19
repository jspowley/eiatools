#------------------------------------Config------------------------------------#

fixed_headers <- '&data[0]=value&sort[0][column]=period&sort[0][direction]=desc&offset='

#------------------------------------Distinct Mapping Function Per Product------------------------------------#

#' EIA Mapping Request
#'
#' @param type String with URL extension for product type
#' @param offset Used to offset pagination in sets of 5000
#' @param api_key String with your eia API key
#'
#' @return A DataFrame containing the unique identifiers for all products
#' @export
#'
#' @examples
eia_map <- function(sub,offset,freq,api_key){

  response <-
    paste0(
      root,
      sub,
      "?api_key=", api_key,
      "&frequency=", freq,
      fixed_headers, offset,'&length=5000') %>%
    eia_call()

  data <- response$data %>%
    dplyr::select(-period, -value) %>%
    dplyr::distinct(series, .keep_all = TRUE)

  return(data)
}



