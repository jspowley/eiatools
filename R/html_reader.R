#' eia News Report Reader
#' @param url The URL of report wanting to read.
#' @return HTML code for specified report, can be rendered in ShinyApp
#' @export
html_reader <- function(){
  url <- "https://www.eia.gov/todayinenergy/detail.php?id=64305"
  page <- read_html(url)

  report <- page %>%
    html_nodes(".tie-article")

  return(report)
}
