## code to prepare `DATASET` dataset goes here

# Init

usethis::use_pipe()

# Why not reference the Description file here? I can understand for datasets, since we can modify and redeploy with ease,
# but when Description is the universal space for defining package imports, I'd expect a team member to go there.

# Data

# Now defined internally:
#root <- "https://api.eia.gov/v2/"
#usethis::use_data(root, overwrite = TRUE)

# my_data <- "We have no need for user accessible data yet! Data is defined via testthat or for function internal use!"
# usethis::use_data(my_data, overwrite = T)

# devtools::load_all()
# route_tree_sample <- route_tree("petroleum/sum", creds::eia_key)
# usethis::use_data(route_tree_sample, overwrite = T)

# PET <- route_tree("petroleum", creds::eia_key)
# usethis::use_data(PET, overwrite = T)

# STEO <- route_tree("steo", creds::eia_key)
# usethis::use_data(STEO, overwrite = T)

# Improved Data Definition for piece-wise index updating
library(devtools)
devtools::load_all()

# Selecting Update Ranges
paths <- eia_meta("", creds::eia_key) %>% get_routes()
paths$id
selections <- c("co2-emissions")

# Getting Updated Routes
r_updates = list()
for(p in 1:length(selections)){
  r_updates[p] <- list(route_tree(selections[p], creds::eia_key))
  names(r_updates)[p] <- selections[p]
}

# Applying Updates to Routes
tryCatch({
  route_index_old <- eiatools::route_index
  print("Ready to update existing index")
  for(p in 1:length(r_updates)){
    print(names(r_updates)[p])
    print(str(list(r_updates[names(r_updates)[p]])))
    route_index_old[names(r_updates)[p]] <- list(r_updates[names(r_updates)[p]][[1]])
  }
  route_index <- route_index_old
  usethis::use_data(route_index, overwrite = T)
  print("Overlaying existing index")
}, error = function(e){
  route_index <- r_updates
  usethis::use_data(route_index, overwrite = T)
  print("Doesn't exist yet.")
})

load_all()
eiatools::route_index

# Data Tree Updates (one at a time)

paths <- eia_meta("", creds::eia_key) %>% get_routes()
paths$id

selection <- "co2-emissions"
route_table <- eiatools::route_index[selection][[1]]
d_updates <- NULL
for(r in 1:nrow(route_table)){
  d_out <- data_tree(route_table[r,], creds::eia_key)
  if(!is.null(d_out)){
  if(is.null(d_updates)){
    d_updates <- d_out
  }else{
    d_updates <- dplyr::bind_rows(d_updates, d_out)
  }
  }
}

tryCatch({
  data_index_old <- eiatools::data_index
  print("Ready to update existing index")
  data_index_old[selection] <- list(d_updates)
  data_index <- data_index_old
  usethis::use_data(data_index, overwrite = T)
  print("Overlaying existing index")
}, error = function(e){
  data_index <- list()
  data_index[selection] <- list(d_updates)
  usethis::use_data(data_index, overwrite = T)
  print("Doesn't exist yet.")
})

load_all()
eiatools::data_index
