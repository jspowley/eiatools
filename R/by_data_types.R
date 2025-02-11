#' by_data_types
#'
#' EIA API calls will not return endpoint rows unless all specified/queried data types are represented in the returned rows. As such, sometimes removing/narrowing the data request is required in order to ensure a valid response. This function simplifies the process of narrowing your request. Use in tandem with show_data_types()
#'
#' @param dindex_in A data_index subset dataframe
#' @param selections A list/vector of data types (strings)
#'
#' @return A data_index dataframe, with narrowed data selections
#' @export
by_data_types <- function(dindex_in, selections){
  dindex_in %>%
    dplyr::rowwise() %>%
    dplyr::mutate(data = list(vector_select(!!rlang::sym("data"), selections))) %>%
    dplyr::ungroup() %>%
    return()
}

vector_select <- function(data_in, selection){
  data_in[data_in %in% selection] %>% return()
}
