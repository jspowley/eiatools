#' d(ata)index_get_data
#'
#' A function accepting rows from the data_index object and then fetches from EIA
#'
#' @param dindex_table a subset of the data_index table
#' @param api_key your eia api key
#' @param start "YYYY-MM-DD"
#' @param end "YYYY-MM-DD"
#'
#' @return A dataframe
#' @export
dindex_get_data <- function(dindex_table, api_key, start = NA, end = NA){

  data_out <- NULL

  for(i in 1:nrow(dindex_table)){
    loop <- TRUE
    dat_out <- NULL
    offset <- 0
    while(loop){
    d_row <- dindex_table[i,]

    f_list <- d_row$facets %>% unlist()
    facet_df <- NULL
    for(f in f_list){
      f_id <- d_row %>% dplyr::pull(f)
      facet_row <- data.frame(facet_name = f, facet_id = f_id)
      if(is.null(facet_df)){
        facet_df <- facet_row
      }else{
        facet_df <- dplyr::bind_rows(facet_df, facet_row)
      }
    }

    # Data cleaning for non-identified facets, displayed in a non_conventional way
    facet_df <- facet_df %>% dplyr::filter(!facet_id == "#N/A")

    d_out <- eia_data(
      api_endpoint = d_row$api_endpoint,
      freq = d_row$freq,
      facets = facet_df,
      start = start,
      end = end,
      sort_df = data.frame(sortby = c("period"), direction = c("desc")),
      data_types = d_row$data,
      offset = offset,
      api_key = api_key
    ) %>%
      dplyr::mutate(nickname = d_row$nickname)

    if(!nrow(d_out) == 5000){
      loop <- FALSE
    }else{
      offset <- offset + 5000
    }

    if(is.null(dat_out)){
      dat_out <- d_out
    }else{
      dat_out <- dplyr::bind_rows(dat_out, d_out)
    }

    }
    if(is.null(data_out)){
      data_out <- dat_out
    }else{
      data_out <- dplyr::bind_rows(data_out, dat_out)
    }
  }
  return(data_out)
}
