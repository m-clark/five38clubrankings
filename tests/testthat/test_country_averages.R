context('test country_averages')

data("rankings_2018", package = "five38clubrankings")

test_that('get_country_averages returns a dataframe', {
  expect_s3_class(get_country_averages(rankings_2018),
                  'data.frame')
})

test_that('get_country_averages can return all results', {
  expect_s3_class(get_country_averages(rankings_2018, drop_countries = FALSE),
                  'data.frame')
})

test_that('get_country_averages will fail if the csv was downloaded', {
  expect_error(get_country_averages(rankings_2018_csv))
})
