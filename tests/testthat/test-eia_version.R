test_that("eia_version works", {
  response <- eia_version(creds::eia_key)

  found_error <- FALSE

  if(!"api" %in% names(response) | !"excel" %in% names(response)){
    found_error <- TRUE
  }

  for(val in response){
    if(!is.character(val)){
      found_error <- TRUE
    }
  }

  expect_equal(found_error, FALSE)
})
