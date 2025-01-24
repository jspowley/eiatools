#' EIA Metadata Request
#'
#' @param sub A string containing subdirectory, or tree of subdir filepaths for the eia API endpoint
#' @param api_key String with your eia api key
#'
#' @return A list containing the json data
#' @export
eia_meta <- function(sub, api_key){
  paste0(root,sub,"?api_key=", api_key) %>%
    eia_call() %>%
    return()
}
