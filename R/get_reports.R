

get_reports <- function(url){
  py_install("pandas openpyxl")
  py_run_string("
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
  combined_df_py <- py$data(url)
  combined_df_r <- reticulate::py_to_r(combined_df_py) %>%
    return()
}
