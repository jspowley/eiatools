#' EIA Version Request
#'
#' @param api_key A string containing your EIA API Key
#'
#' @return A list of strings containing API and Excel Versions for EIA's web service
#' @export
eia_version <- function(api_key){

  buffer <-
    root %>%
    map_headers(api_key = api_key) %>%
    httr::GET() %>%
    httr::content(as = "text", encoding = 'UTF-8') %>%
    jsonlite::fromJSON()

  return(
    list(
      api = buffer$apiVersion,
      excel = buffer$ExcelAddInVersion
    )
  )
}
