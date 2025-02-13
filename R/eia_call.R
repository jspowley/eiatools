#' eia_call
#'
#' Function for handling api requests at an atomic level.
#' Also includes url cleaning components autaomatically applied by most web broswers
#'
#' @param endpoint a url endpoint, with headers attached
#' @param sleep integer of number of seconds to wait before continuing
#'
#' @return A response in json list format
eia_call <- function(endpoint, sleep = 5, depth = 1){

  endpoint <- stringr::str_replace_all(endpoint, pattern = " ", replacement = "%20")

  # print(endpoint)


  response <- tryCatch({httr::GET(endpoint) %>%
    httr::content(as = "text", encoding = 'UTF-8') %>%
    jsonlite::fromJSON()},
  error = function(e){
    if(depth < 5){
      Sys.sleep(60)
      eia_call(endpoint, sleep, depth = depth + 1)
    }else{
      warning(paste0("Timeout on 5 attempts for ",endpoint))
      list(list()) # Ensures an exit condition if no response is found within 5 tries, emulates fetching no data at the endpoint similar to endpoints with 0 values returned
    }
  })

  Sys.sleep(sleep)

  response$response %>%
    return()
}

y <- tryCatch({b}, error = function(e){
  warning("Hello")
  list(list())})
