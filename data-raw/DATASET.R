## code to prepare `DATASET` dataset goes here

# Init

usethis::use_pipe()
usethis::use_mit_license()

# Why not reference the Description file here? I can understand for datasets, since we can modify and redeploy with ease,
# but when Description is the universal space for defining package imports, I'd expect a team member to go there.

# Data

# Now defined internally:
#root <- "https://api.eia.gov/v2/"
#usethis::use_data(root, overwrite = TRUE)

my_data <- "We have no need for user accessible data yet! Data is defined via testthat or for function internal use!"
usethis::use_data(my_data, overwrite = T)

devtools::load_all()
route_tree_sample <- route_tree("petroleum/sum", creds::eia_key)
usethis::use_data(route_tree_sample, overwrite = T)

# Packages

usethis::use_r("dplyr")
usethis::use_r("httr")
usethis::use_r("jsonlite")
usethis::use_r("lubridate")
usethis::use_r("stringr")
usethis::use_r("reticulate")
