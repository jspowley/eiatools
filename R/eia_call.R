#' eia_call
#'
#' @param endpoint a url endpoint, with headers attached
#' @param sleep integer of number of seconds to wait before continuing
#'
#' @return A response in json list format
eia_call <- function(endpoint, sleep = 5){

  # print(endpoint)
  response <- httr::GET(endpoint) %>%
    httr::content(as = "text", encoding = 'UTF-8') %>%
    jsonlite::fromJSON()

  Sys.sleep(sleep)

  response$response %>%
    return()
}
