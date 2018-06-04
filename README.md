<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build
Status](https://travis-ci.org/m-clark/tidyext.svg?branch=master)](https://travis-ci.org/m-clark/five38clubrankings)

five38clubrankings
------------------

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
