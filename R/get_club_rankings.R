#' Get the current rankings
#' @description Download soccer club rankings as provided by 538.
#'
#' @param csv  See details.
#'
#' @description Download soccer club rankings from 538
#' @details This uses the \href{https://github.com/hadley/rvest}{rvest} package
#'   to download football club rankings as provided by 538.  It has one
#'   argument, whether you want to use their API to get the `*.csv`, or not.  It
#'   is FALSE by default, as country and one-week change are available from the
#'   table on their website. As a result, the
#'   \code{\link[five38clubrankings]{get_country_averages}} and \code{\link[five38clubrankings]{get_league_averages}} function will not
#'   work if you use the csv rankings.
#' @return A data frame of the rankings
#' @importFrom magrittr extract2
#' @importFrom rvest html_table
#' @importFrom xml2 read_html
#' @importFrom magrittr "%>%"
#' @importFrom dplyr mutate
#' @importFrom readr read_csv
#' @examples
#' \dontrun{
#' get_club_rankings()
#' }
#' @export
get_club_rankings <- function(csv = FALSE) {

  if (csv)
    return(readr::read_csv('https://projects.fivethirtyeight.com/soccer-api/club/spi_global_rankings.csv'))

  init <- xml2::read_html('https://projects.fivethirtyeight.com/global-club-soccer-rankings/')

  ranks <- init %>%
    rvest::html_table() %>%
    magrittr::extract2(1)

 ranks <- ranks[-1,]

 colnames(ranks) <- c('rank', 'one_wk_chg', 'team', 'league', 'country',
                      'off_rating', 'def_rating', 'spi')
 ranks %>%
   dplyr::mutate(rank = as.integer(rank),
                 one_wk_chg = as.integer(one_wk_chg),
                 one_wk_chg = ifelse(is.na(one_wk_chg), 0, one_wk_chg),
                 off_rating = as.numeric(off_rating),
                 def_rating = as.numeric(def_rating),
                 spi = as.numeric(spi))
}
