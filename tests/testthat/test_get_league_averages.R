context('test league summary')

data("rankings_2018", package = "five38clubrankings")

test_that('get_league_averages returns a dataframe', {
  expect_s3_class(get_league_averages(rankings_2018),
                  'data.frame')
})

test_that('get_league_averages can return all results', {
  expect_s3_class(get_league_averages(rankings_2018, drop_leagues = FALSE),
                  'data.frame')
})
