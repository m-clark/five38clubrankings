[![Build
Status](https://travis-ci.org/m-clark/five38clubrankings.svg?branch=master)](https://travis-ci.org/m-clark/five38clubrankings)
[![codecov](https://codecov.io/gh/m-clark/five38clubrankings/branch/master/graph/badge.svg)](https://codecov.io/gh/m-clark/five38clubrankings)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/m-clark/five38clubrankings?branch=master&svg=true)](https://ci.appveyor.com/project/m-clark/five38clubrankings)

# five38clubrankings

This package just grabs the table located at
<https://projects.fivethirtyeight.com/global-club-soccer-rankings/>, and
additionally does some summary by league and country. You can get the
csv at <https://github.com/fivethirtyeight/data/tree/master/soccer-spi>,
but that doesn’t have country or one-week change. The main function is
`get_club_rankings`.

### Installation

The usual GitHub installation. **devtools** package required.

``` r
devtools::install_github('m-clark/five38clubrankings')
```
