
#' Get available countries
#'
#' @export
#'
#' @examples
#'  library(nagerdate)
#'
#'  nd_available_countries()
#'
nd_available_countries <- function(){

  base_url <- "https://date.nager.at/api/v3/AvailableCountries"

  req <- httr2::request(base_url = base_url) |>
    httr2::req_user_agent(string = "nagerdate (https://github.com/krose/nagerdate)")

  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()

  resp
}


#' Get country info
#'
#' @param country_code Country code.
#'
#' @export
#'
#' @examples
#'  library(tidyverse)
#'  library(nagerdate)
#'
#'  de <- nd_country_info("DE")
#'
#'  de_borders <- de |> tidyr::unnest(borders, names_sep = "_")
#'
nd_country_info <- function(country_code){

  base_url <- paste0("https://date.nager.at/api/v3/CountryInfo/", country_code)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_user_agent(string = "nagerdate (https://github.com/krose/nagerdate)")

  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON()

  df <- tibble::tibble(commonName = resp$commonName,
                       officialName = resp$officialName,
                       countryCode = resp$countryCode,
                       region = resp$region,
                       borders = list(resp$borders))
  df
}

