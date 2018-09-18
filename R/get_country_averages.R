#' Get country averages
#' @description Get average rankings per country
#'
#' @param rankings Rankings created by \code{get_club_rankings}
#' @param drop_countries Drop countries that only made a tournament appearance,
#'   but for which 538 does not track their primary league. Default is TRUE.
#' @param top_tier_only Show results for only the top tier. Default is TRUE.
#'
#' @details Takes the rankings you create with \code{get_club_rankings} and gets
#'   country averages.
#' @return A data frame of country rankings
#' @examples
#' library(five38clubrankings)
#' get_country_averages(rankings_2018)
#' @importFrom dplyr group_by summarise ungroup mutate arrange desc filter
#' @export
#'
get_country_averages <- function(rankings,
                                 drop_countries = TRUE,
                                 top_tier_only = TRUE
                                 ) {
  if (drop_countries)
    rankings <- rankings %>%
      dplyr::filter(country != '')

  if (top_tier_only)
    rankings <- rankings %>%
      filter(! league %in% c('La Liga 2', '2. Bundesliga', 'Ligue 2',
                             'Championship', 'League One', 'League Two',
                             'Serie B'))

    rankings %>%
      dplyr::group_by(country) %>%
      dplyr::summarise(off_rating = mean(off_rating),
                       def_rating = mean(def_rating),
                       spi = mean(spi),
                       n_teams = n()) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(rank = rank(-spi)) %>%
      dplyr::arrange(dplyr::desc(spi))
}
