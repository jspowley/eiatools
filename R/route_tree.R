route_tree <- function(sub = "", api_key, iter = 1){

  output <- NULL
  m_data <- eia_meta(sub = sub, api_key = api_key)

  if(detect_routes(m_data = m_data)){
    routes <- get_routes(m_data)

    for(i in 1:nrow(routes)){

      next_path <- paste0(sub,"/", routes$id[i])
      layer_out <- route_tree(sub = next_path, api_key = api_key, iter = iter + 1) %>%
        dplyr::mutate(!!sym(paste0("route_",iter+1,"_id")) := routes$id[i])

      if("name" %in% names(routes)){
        layer_out <- layer_out %>% dplyr::mutate(!!sym(paste0("route_",iter+1,"_name")) := routes$name[i])
      }
      if("description" %in% names(routes)){
        layer_out <- layer_out %>% dplyr::mutate(!!sym(paste0("route_",iter+1,"_description")) := routes$description[i])
      }
    }

    return(routes)
  }else{

    layer_out <- NULL
    api_endpoint <- sub
    freqs <- get_all_freq(m_data)

    layer_out <- data.frame(api_endpoint = api_endpoint, freq = freqs)
    return(layer_out)

    facet_opts

  }

  if(iter == 1){
    if("name" %in% names(m_data)){
      output <- output %>% dplyr::mutate(route_1_name = m_data$name)
    }
    if("id" %in% names(m_data)){
      output <- output %>% dplyr::mutate(route_1_id = m_data$id)
    }
    if("description" %in% names(m_data)){
      output <- output %>% dplyr::mutate(route_1_description = m_data$description)
    }
  }

  return(output)

}
