context('test country_averages')

data("rankings_2018", package = "five38clubrankings")

test_that('country_averages returns a dataframe', {
  expect_s3_class(country_averages(rankings_2018), 'data.frame')
})

test_that('country_averages can return all results', {
  expect_s3_class(country_averages(rankings_2018, drop_countrys = FALSE), 'data.frame')
})

test_that('country_averages will fail if the csv was downloaded', {
  expect_error(country_averages(rankings_2018_csv))
})
