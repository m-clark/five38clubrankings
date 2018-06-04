#' Get league averages
#' @description Get average rankings per league
#'
#' @param rankings Rankings created by \code{get_club_rankings}
#' @param drop_leagues Drop some miscellaneous teams that made it to Champions
#'   or Europa League but whose domestic league is not included. Default is
#'   true.
#'
#' @details Takes the rankings you create with \code{get_club_rankings} and gets
#'   league averages.
#' @return A data frame of league rankings
#' @examples
#' library(five38clubrankings)
#' league_averages(rankings_2018)
#' @importFrom dplyr group_by summarise ungroup mutate arrange desc filter
#' @export
#'
league_averages <- function(rankings, drop_leagues=TRUE) {
  if(drop_leagues)
    rankings <- dplyr::filter(rankings, ! league %in% c('Champions League', 'Europa League'))
  rankings %>%
    dplyr::group_by(league) %>%
    dplyr::summarise(off_rating = mean(off_rating),
                     def_rating = mean(def_rating),
                     spi = mean(spi),
                     n_teams = n()) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(rank = rank(-spi)) %>%
    dplyr::arrange(dplyr::desc(spi))
}
