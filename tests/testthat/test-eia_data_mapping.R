test_that("eia_map_works", {

  key <- creds::eia_key

  expect_no_error({
  products <- c('petroleum/pri/spt/data', 'natural-gas/pri/sum/data') ## These Are The Only Two That Have Price Data Related (So They Maintain Consistent Columns)
  all_series <- list() ## Discuss What We Care About Mapping For This Project


  for (product in products){
    df <- eia_map(sub = product, offset = 0, freq = "monthly", api_key = key)
    all_series <- append(all_series, list(df))
  }

  all_series_df <- dplyr::bind_rows(all_series)

  all_series_df ## Missing Multiple // Will Work On This Week, Wanted A General Idea
  })
})
