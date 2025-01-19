#' EIA Version Request
#'
#' @param api_key A string containing your EIA API Key
#'
#' @return A list of strings containing API and Excel Versions for EIA's web service
#' @export
#'
#' @examples
eia_version <- function(api_key){

  buffer <- httr::GET(paste0(root,"?api_key=", api_key)) %>%
    httr::content(as = "text") %>%
    jsonlite::fromJSON()

  return(
    list(
      api = buffer$apiVersion,
      excel = buffer$ExcelAddInVersion
    )
  )
}
