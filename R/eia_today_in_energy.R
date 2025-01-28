#' EIA Today In Energy Reports List
#'
#'
#' @return A list of strings containing titles, url links, and dates of recent publications.
#' @export
eia_today_in_energy <- function(){
  xml_data <- xml2::read_xml("https://www.eia.gov/rss/todayinenergy.xml")
  nodes <- xml_find_all(xml_data, "//item")
  titles <- xml_text(xml_find_all(nodes, "./title"))
  links <- xml_text(xml_find_all(nodes, "./link"))
  dates <- xml_text(xml_find_all(nodes, "./pubDate"))

  return(
    list(
      title = titles,
      link = links,
      date = dates
    )
  )
}

