## code to prepare `DATASET` dataset goes here

# usethis::use_pipe()
# usethis::use_package("dplyr")
root <- "https://api.eia.gov/v2/"
usethis::use_data(root, overwrite = TRUE)
