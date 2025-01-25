#' EIA Meta Data Tree
#'
#' @param sub A subdirectory on EIA's api url, for example, "petroleum"
#' @param api_key Your eia api key
#' @param iter A counter used in recursion, internal to the function
#' @param iter_offset A reindexing value used in recursion, internal to the function
#'
#' @return A metadata tibble
#' @export
route_tree <- function(sub = "", api_key, iter = 1, iter_offset = 1){

  print(sub)

  output <- NULL
  m_data <- eia_meta(sub = sub, api_key = api_key)

  if(iter == 1 & (sub == "" | is.na(sub) | is.null(sub))){
    iter_offset <- 0
  }

  if(detect_routes(m_data = m_data)){
    routes <- get_routes(m_data)

    for(i in 1:nrow(routes)){

      next_path <- paste0(sub,"/", routes$id[i])
      layer_out <- route_tree(sub = next_path, api_key = api_key, iter = iter + 1, iter_offset = iter_offset) %>%
        dplyr::mutate(!!rlang::sym(paste0("route_",iter+iter_offset,"_id")) := routes$id[i])

      if("name" %in% names(routes)){
        layer_out <- layer_out %>% dplyr::mutate(!!rlang::sym(paste0("route_",iter+iter_offset,"_name")) := routes$name[i])
      }
      if("description" %in% names(routes)){
        layer_out <- layer_out %>% dplyr::mutate(!!rlang::sym(paste0("route_",iter+iter_offset,"_description")) := routes$description[i])
      }

      if(is.null(output)){
        output <- layer_out
      }else{
        output <- dplyr::bind_rows(output, layer_out)
      }
    }
  }else{

    layer_out <- NULL
    api_endpoint <- sub
    freqs <- get_all_freq(m_data = m_data)

    facet_types <- get_facet_types(m_data = m_data)
    data_types <- get_data_types(m_data = m_data)

    # print(str(data_types))
    # print(str(facet_types))

    if(is.list(data_types) & length(data_types) == 0){
      data_types <- NA
    }

    if(is.null(m_data$startPeriod)){m_data$startPeriod <- NA}
    if(is.null(m_data$endPeriod)){m_data$endPeriod <- NA}

    layer_out <- data.frame(
      api_endpoint = api_endpoint,
      freq = I(list(freqs)),
      facets = I(list(facet_types)),
      data = I(list(data_types)),
      start_period = m_data$startPeriod,
      end_period = m_data$endPeriod
    )

    for(f in facet_types){
      facet_data <- get_facet_data(sub = sub, facet_id = f, api_key = api_key)

      if(!(is.list(facet_data) & length(facet_data) == 0)){

      layer_out <- layer_out %>%
        dplyr::mutate(
          !!rlang::sym(f) := tidyr::nest(facet_data),
          !!rlang::sym(f) := purrr::map(!!rlang::sym(f),1))
      }
    }

    return(layer_out)

  }

  if(iter == 1 & (!sub == "" | is.na(sub) | is.null(sub))){
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

  return(output %>% tibble::as_tibble())

}
