#------------------------------------Config------------------------------------#

default_headers <- list(
  sort = 'period',
  direction = 'desc',
  data = 'value',
  length = '5000'
)

#------------------------------------Distinct Mapping Function Per Product------------------------------------#

#' EIA Mapping Request
#'
#' @param sub String containing subdirectory for EIA endpoint
#' @param offset Used to offset pagination in sets of 5000
#' @param api_key String with your EIA API key
#' @param freq String with an EIA frequency code
#'
#' @return A DataFrame containing the unique identifiers for updated/recent data for products
#' @export
eia_map <- function(sub,offset,freq,api_key){

  path <- paste0(root,sub)
  headers <- append(default_headers, list(offset = offset, freq = freq))

  request <- map_headers(url = path, api_key = api_key, headers = headers) %>%
    eia_call()

  data <- request$data

  deselect_list <- c("period", "value")

  for(des in deselect_list){
    if(des %in% colnames(data)){
      data <- data %>% dplyr::select(-dplyr::all_of(des))
    }
  }

  data <- data %>%
    dplyr::distinct()

  return(data)
}



