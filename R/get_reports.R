#' EIA Get Weekly Status Report Request
#'
#' @param url String with the URL to given xlsx file
#'
#' @return DataFrame
#' @export
get_reports <- function(url){
  reticulate::py_install("pandas")
  reticulate::py_install("openpyxl")
  # Why Python? No JS dependency or out of date, broken xls package this way.
  # This is one of the 10% of use cases where python is better,
  # since the file type is niche and Python has the wider user base needed to keep the parser supported.
  reticulate::py_run_string("
import pandas as pd

def data(url):
    excel_file = pd.ExcelFile(url)
    dfs = []
    for sheet_name in excel_file.sheet_names[1:]:
        df = pd.read_excel(url, sheet_name=sheet_name, header=None)
        df = df.iloc[1:]
        new_header = df.iloc[0].astype(str) + '___' + df.iloc[1].astype(str)
        df.columns = new_header
        df = df.iloc[2:]
        dfs.append(df)
    combined_df = pd.concat(dfs, ignore_index=True)
    return combined_df
")
  combined_df_py <- reticulate::py$data(url)
  combined_df_r <- reticulate::py_to_r(combined_df_py) %>%
    return()
}
