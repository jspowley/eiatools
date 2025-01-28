#' eia News Report Reader
#' @param url The URL of report wanting to read.
#' @return HTML code for specified report, can be rendered in ShinyApp
#' @export
html_reader <- function(url){
  page <- rvest::read_html(url)

  report <- page %>%
    rvest::html_nodes(".tie-article")

  return(report)
}
