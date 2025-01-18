## code to prepare `DATASET` dataset goes here

# Init

usethis::use_pipe()
usethis::use_mit_license()

# Why not reference the Description file here? I can understand for datasets, since we can modify and redploy with ease.

# Data

root <- "https://api.eia.gov/v2/"
usethis::use_data(root, overwrite = TRUE)

# Packages

usethis::use_r("dplyr")
usethis::use_r("httr")
usethis::use_r("jsonlite")
usethis::use_r("lubridate")
usethis::use_r("stringr")
