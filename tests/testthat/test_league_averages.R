context('test league summary')

data("rankings_2018", package = "five38clubrankings")

test_that('pre_process returns a dataframe', {
  expect_s3_class(league_averages(rankings_2018), 'data.frame')
})

test_that('pre_process can return all results', {
  expect_s3_class(league_averages(rankings_2018, drop_leagues = FALSE), 'data.frame')
})
