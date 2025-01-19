#' EIA Mapping Request
#'
#' @param type String with URL extension for product type
#' @param offset Used to offset pagination in sets of 5000
#' @param api_key String with your eia API key
#'
#' @return A DataFrame containing the unique identifiers for all products
#' @export
#'
#' @examples
#'
library(dplyr)
library(httr)
library(jsonlite)

#------------------------------------API INFORMATION (KEY TO BE CHANGED)------------------------------------#

url <- '&frequency=monthly&data[0]=value&sort[0][column]=period&sort[0][direction]=desc&offset='
key <- 'OaPIhpkD7JVc5gb7xOTMZMh9iA9uegIVBFRj6wQg' ## Connect To Project Key Instead


#------------------------------------Distinct Mapping Function Per Product------------------------------------#

eia_map <- function(type,offset,api_key){
  response <- httr::GET(paste0("https://api.eia.gov/v2/",type,"?api_key=", api_key,url,offset,'&length=5000')) %>%
    httr::content(as = "text", encoding = 'UTF-8') %>%
    jsonlite::fromJSON()

  data <- response$response$data %>%
    dplyr::select(-period, -value) %>%
    dplyr::distinct(series, .keep_all = TRUE)
  return(data)
}


#------------------------------------Build DataFrame For All Available Products------------------------------------#

products <- c('petroleum/pri/spt/data', 'natural-gas/pri/sum/data/') ## These Are The Only Two That Have Price Data Related (So They Maintain Consistent Columns)
all_series <- list() ## Discuss What We Care About Mapping For This Project


for (product in products){
  df <- eia_map(type = product, offset = 0,api_key = key )
  all_series <- dplyr::append(all_series, list(df))
}

all_series_df <- dplyr::bind_rows(all_series)

all_series_df ## Missing Multiple // Will Work On This Week, Wanted A General Idea



