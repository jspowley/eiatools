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
