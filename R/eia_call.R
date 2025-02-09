#' eia_call
#'
#' Function for handling api requests at an atomic level.
#' Also includes url cleaning components autaomatically applied by most web broswers
#'
#' @param endpoint a url endpoint, with headers attached
#' @param sleep integer of number of seconds to wait before continuing
#'
#' @return A response in json list format
eia_call <- function(endpoint, sleep = 5){

  endpoint <- stringr::str_replace_all(endpoint, pattern = " ", replacement = "%20")

  print(endpoint)
  response <- httr::GET(endpoint) %>%
    httr::content(as = "text", encoding = 'UTF-8') %>%
    jsonlite::fromJSON()

  Sys.sleep(sleep)

  response$response %>%
    return()
}
