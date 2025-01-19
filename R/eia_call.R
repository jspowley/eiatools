#' eia_call
#'
#' @param endpoint a url endpoint, with headers attached
#'
#' @return A response in json list format
eia_call <- function(endpoint){
  httr::GET(endpoint) %>%
    httr::content(as = "text", encoding = 'UTF-8') %>%
    jsonlite::fromJSON() %>%
    .$response %>%
    return()
}
