data_tree <- function(r_tree, api_key){

  output <- NULL
  for(r in 1:nrow(r_tree)){

    r_row <- r_tree[r,]
    endpoint <- r_row$api_endpoint
    freq <- r_row$freq %>% unlist()
    # data <- r_row$data

    data_out <- NULL

    print(endpoint)

    for(f in freq){

      print(paste0("  ",f))

      found_duplicates <- FALSE
      d_out <- NULL
      offset <- 0

      while(!found_duplicates){

        print(paste0("    ", offset))

        d <- eia_data(
          api_endpoint = endpoint,
          freq = f,
          offset = offset,
          api_key = api_key)

        print("Data fetched")
        print(utils::str(d))

        if(length(d)>0){

        if(is.null(d)){
          print("Assigned new d_out")
          d_out <- d
        }else{
          print("Row expanded d_out")
          d_out <- dplyr::bind_rows(d_out, d)
        }

        r_count <- nrow(d_out)
        dist_count <- nrow(d_out %>% dplyr::select(-dplyr::any_of("period")) %>% dplyr::distinct())

        if(dist_count < r_count){
          print("Range narrowed, exiting")
          found_duplicates <- TRUE
        }else{
          print("Increasing Offset")
          offset <- offset + 5000
        }

        }else{
          print("Exiting due to zero length list")
          found_duplicates <- TRUE
        }

      }

      if(!is.null(d_out)){
      d_out <- d_out %>%
        dplyr::select(-dplyr::any_of("period")) %>%
        dplyr::distinct() %>%
        dplyr::mutate(freq = f)

      if(is.null(data_out)){
        data_out <- d_out
      }else{
        data_out <- dplyr::bind_rows(data_out, d_out)
      }
      }
    }

    if(!is.null(data_out)){
    data_out <- data_out %>%
      dplyr::bind_cols(
        r_row %>%
          dplyr::select(
            dplyr::any_of(
            c(
            "api_endpoint",
            "facets",
            "data",
            "units",
            "route_1_id",
            "route_1_name",
            "route_1_description",
            "route_2_id",
            "route_2_name",
            "route_2_description",
            "route_3_id",
            "route_3_name",
            "route_3_description"))))

    if(is.null(output)){
      output <- data_out
    }else{
      output <- dplyr::bind_rows(output, data_out)
    }
    }
  }
  return(output %>% dplyr::mutate(nickname = NA) %>% tibble::as_tibble())
}
