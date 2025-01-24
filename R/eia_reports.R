#' EIA Generate All Weekly Status Reports
#'
#' @param category String listing report name, options('petroleum')
#' @return DataFrame
#' @export

## Missing Other Reports - Discuss Which Reports Needed In This Format

eia_reports <- function(category){

  petroleum <- c('https://ir.eia.gov/wpsr/psw01.xls',
                   'https://ir.eia.gov/wpsr/psw02.xls',
                   'https://ir.eia.gov/wpsr/psw03.xls',
                   'https://ir.eia.gov/wpsr/psw04.xls',
                   'https://ir.eia.gov/wpsr/psw05.xls',
                   'https://ir.eia.gov/wpsr/psw05a.xls',
                   'https://ir.eia.gov/wpsr/psw06.xls',
                   'https://ir.eia.gov/wpsr/psw07.xls',
                   'https://ir.eia.gov/wpsr/psw08.xls',
                   'https://ir.eia.gov/wpsr/psw09.xls',
                   'https://ir.eia.gov/wpsr/psw11.xls',
                   'https://ir.eia.gov/wpsr/psw12.xls',
                   'https://ir.eia.gov/wpsr/psw13.xls',
                   'https://ir.eia.gov/wpsr/psw14.xls'
  )

  if (category == 'petroleum'){
    reports <- petroleum
  } else{
    stop(("Category Not Recognized, Please Choose: 'Petroleum'"))
  }

  df <- data.frame()

  for (report in reports){
    new_df <- get_reports(report)
    df <- rbind(df, new_df)
  }

  return(df)

}
