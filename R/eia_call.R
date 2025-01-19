eia_call <- function(endpoint){
  httr::GET(endpoint) %>%
    httr::content(as = "text") %>%
    jsonlite::fromJSON() %>%
    .$response %>%
    return()
}
