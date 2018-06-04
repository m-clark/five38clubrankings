#' Get country averages
#' @description Get average rankings per country
#'
#' @param rankings Rankings created by \code{get_club_rankings}
#' @param drop_countrys Drop some miscellaneous teams that made it to Champions
#'   or Europa country but whose domestic country is not included. Default is
#'   true.
#'
#' @details Takes the rankings you create with \code{get_club_rankings} and gets
#'   country averages.
#' @return A data frame of country rankings
#' @examples
#' library(five38clubrankings)
#' country_averages(rankings_2018)
#' @importFrom dplyr group_by summarise ungroup mutate arrange desc filter
#' @export
#'
country_averages <- function(rankings, drop_countrys=TRUE) {
  if(drop_countrys)
    rankings <- dplyr::filter(rankings, ! country %in% c('Champions country', 'Europa country'))
  rankings %>%
    dplyr::filter(country != '') %>%
    dplyr::group_by(country) %>%
    dplyr::summarise(off_rating = mean(off_rating),
                     def_rating = mean(def_rating),
                     spi = mean(spi),
                     n_teams = n()) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(rank = rank(-spi)) %>%
    dplyr::arrange(dplyr::desc(spi))
}
