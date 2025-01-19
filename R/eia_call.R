eia_call <- function(endpoint){
  httr::GET(endpoint) %>%
    httr::content(as = "text", encoding = 'UTF-8') %>%
    jsonlite::fromJSON() %>%
    .$response %>%
    return()
}
