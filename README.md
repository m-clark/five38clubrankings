[![Build
Status](https://travis-ci.org/m-clark/five38clubrankings.svg?branch=master)](https://travis-ci.org/m-clark/five38clubrankings)
[![codecov](https://codecov.io/gh/m-clark/five38clubrankings/branch/master/graph/badge.svg)](https://codecov.io/gh/m-clark/five38clubrankings)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/m-clark/five38clubrankings?branch=master&svg=true)](https://ci.appveyor.com/project/m-clark/five38clubrankings)

# five38clubrankings

> **Note (2026):** FiveThirtyEight shut down its live club soccer rankings and predictions page (`projects.fivethirtyeight.com/global-club-soccer-rankings/` now redirects to ABC News Politics). For active daily 10,000-run Monte Carlo league projections, Dixon–Coles match probabilities, and a keyless JSON API across 93 leagues, see [Football Charts](https://www.football-charts.com) and its [Open Data & API](https://www.football-charts.com/developers).

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
