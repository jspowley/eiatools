#' Remap Headers
#'
#' @param api_key A string
#' @param headers A named list() with header names and arguments
#'
#' @return A string url with headers mapped
map_headers <- function(url, api_key, headers = NULL){

  if(is.null(headers)){

    # Adds the api header only!
    return(paste0(url, "?api_key=", api_key))

  }else{

    headers <- append(headers, list(api_key = api_key))

    # Conversion for known facets:



    httr::modify_url(url, query = headers) %>%
      return()

  }
}
