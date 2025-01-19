#' Remap Headers
#'
#' @param url A string with the url endpoint
#' @param api_key A string with your EIA API key
#' @param headers A named list(sort = "", direction = "", data = "", freq = ""...) with header names and arguments
#'
#' @return A string url with headers mapped
map_headers <- function(url, api_key, headers = NULL){

  if(is.null(headers)){

    # Adds the api header only!
    return(paste0(url, "?api_key=", api_key))

  }else{

    headers <- append(headers, list(api_key = api_key))

    # Conversion for known facets and headers:
    conversion_table <- list(
      sort = "sort[0][column]",
      direction = "sort[0][direction]",
      data = "data[0]",
      freq = "frequency"
    )

    for(i in 1:length(headers)){
      header_name <- names(headers)[i]
      if(header_name %in% names(conversion_table)){
        names(headers)[i] <- conversion_table[header_name][[1]]
      }
    }

    header_string <- paste(names(headers), unlist(headers), sep = "=", collapse = "&")
    paste0(url, "?", header_string) %>% return()
  }
}
