#' eia_data_call
#'
#' @param api_endpoint an eia api endpoint subsirectory, as a string
#' @param freq a valid eia frequency for the endpoint, a string
#' @param facets a dataframe with cols facet_name, facet_id
#' @param start A string in "YYYY-MM-DD" format
#' @param end A string in "YYYY-MM-DD" format
#' @param sort_df A dataframe with sortby = column_name and direction = c(asc,desc)columns. First rows take sort priority
#' @param data_types A list of valid datatypes to pull
#' @param offset A numeric, for pagination of results
#' @param api_key Your eia api key
#'
#' @return A dataframe
#' @export
eia_data <- function(
  api_endpoint, #
  freq, #
  facets = NULL,
  start = NA, #
  end = NA, #
  sort_df = data.frame(sortby = c("period"), direction = c("desc")),
  data_types = NULL,
  offset = NA, #
  api_key){ #

  api_req <- paste0(root, api_endpoint, "/data", "?api_key=", api_key)

  # Adding start header
  if(!is.na(start)){
    api_req <- api_req <- paste0(api_req, "&start=", start)
  }

  # Adding end header
  if(!is.na(end)){
    api_req <- api_req <- paste0(api_req, "&end=", end)
  }

  # Adding offset
  if(!is.na(offset)){
    api_req <- api_req <- paste0(api_req, "&offset=", offset)
  }

  # Adding data column names
  if(!is.null(data_types)){
    data_types <- data_types %>% unlist()
    for(i in 1:length(data_types)){
      api_req <- paste0(api_req, "&data[", i-1, "]=", data_types[i])
    }
  }else{
    warning("Won't perform a data/value pull without data types.")
  }

  # Adding facets from facet df
  if(!is.null(facets)){
    for(i in 1:nrow(facets)){
      api_req <- paste0(api_req, "&facets[", facets$facet_name[i],"][]=", facets$facet_id[i])
    }
  }
  # Adding sort params
  for(i in 1:nrow(sort_df)){
    api_req <- paste0(api_req, "&sort[", i-1, "][column]=", sort_df[i,]$sortby, "&sort[", i-1, "][direction]=", sort_df[i,]$direction)
  }

  return(api_req %>% eia_call() %>% .$data)
}
