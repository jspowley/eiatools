
## TESTS
my_global_var_test <- "Data Connection To eia Will Be Done On This Page"
#data_index_test <- dindex_get_data(data_index[["steo"]][["seriesDescription"]], api_key, "2024-01-01",  "2025-01-01") ## Error Message

## DATA
data_list <- data_index


## SELECTION
source_list_select <- "steo" ## Need A Place-Holder Before Selection
category_list_select <- "NONE" ## Need A Place-Holder Before Selection
data_list_select <- "NONE" ## Need A Place-Holder Before Selection

report_content <- "NONE" ## Need A Place-Holder Before Report Is Selected

## LISTS
news_list <- eia_today_in_energy()
tools_list <- c("Regression", "Correlation", "Covariance", "Moving Window", "GARCH")

source_list <- names(data_list)
category_list <- names(data_list[[source_list_select]])
data_list <- names(data_list[[source_list_select]][[category_list_select]])


