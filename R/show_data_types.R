#' show_data_types
#'
#' Shows the various datatypes available within a data_index dataframe
#'
#' @param dindex_in A data_index dataframe
#'
#' @return A vector of data types
#' @export
show_data_types <- function(dindex_in){
  dindex_in %>%
    dplyr::pull(!!rlang::sym("data")) %>%
    unlist() %>%
    unique() %>%
    return()
}
