

#' Get country info
#'
#' @param country_code Country code.
#' @param year Year.
#'
#' @export
#'
#' @examples
#'  library(nagerdate)
#'
#'  de <- nd_holidays("DE")
#'
#'
nd_holidays <- function(country_code, year){

  base_url <- paste0("https://date.nager.at/api/v3/PublicHolidays/", year, "/", country_code)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_user_agent(string = "nagerdate (https://github.com/krose/nagerdate)")

  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()

  resp
}
