#' Collapse Index
#' A function for converting lists of dataframe to a row stacked dataframe
#' @param list_in A list of dataframes.
#'
#' @return
#' @export
#'
#' @examples
collapse_index <- function(list_in){
  output <- NULL
  for(i in 1:length(list_in)){
    tab <- list_in[i][[1]]
    if(is.null(output)){
      output <- tab
    }else{
      output <- dplyr::bind_rows(output, tab)
    }
  }
  return(output)
}
