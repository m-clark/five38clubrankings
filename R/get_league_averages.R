#' Get league averages
#' @description Get average rankings per league
#'
#' @param rankings Rankings created by \code{get_club_rankings}
#' @param drop_leagues Drop some miscellaneous teams that made it to Champions
#'   or Europa League but whose domestic league is not included. Default is
#'   TRUE.
#'
#' @details Takes the rankings you create with \code{get_club_rankings} and gets
#'   league averages.
#' @return A data frame of league rankings
#' @examples
#' library(five38clubrankings)
#' get_league_averages(rankings_2018)
#' @importFrom dplyr group_by summarise ungroup mutate arrange desc filter
#' @export
#'
get_league_averages <- function(rankings, drop_leagues=TRUE) {
  if(drop_leagues)
    # countries for drop_leagues will have no country
    rankings <- rankings %>%
      dplyr::filter(country != '')

  rankings %>%
    dplyr::group_by(country, league) %>%
    dplyr::summarise(off_rating = mean(off_rating),
                     def_rating = mean(def_rating),
                     spi = mean(spi),
                     n_teams = n()) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(rank = rank(-spi)) %>%
    dplyr::arrange(dplyr::desc(spi))
}
