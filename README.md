
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nagerdate

<!-- badges: start -->
<!-- badges: end -->

The goal of nagerdate is to create a convenient API wrapper to the
[Nager.Date](https://github.com/nager/Nager.Date) API.

The Nager.Date API has an interface for getting holidays for a long list
of countries for these holiday variants:

- Public holidays
- Bank holidays
- School holidays
- Authority holidays
- Optional holidays where most people take a day off
- Observance holidays for optional festivities.

## Installation

You can install the development version of nagerdate like so:

``` r
remotes::install_github("krose/nagerdate")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(nagerdate)

# Get the suported countries
head(nd_available_countries())
#> # A tibble: 6 x 2
#>   countryCode name         
#>   <chr>       <chr>        
#> 1 AD          Andorra      
#> 2 AL          Albania      
#> 3 AR          Argentina    
#> 4 AT          Austria      
#> 5 AU          Australia    
#> 6 AX          Åland Islands

# Get the country info for Germany
head(nd_country_info(country_code = "DE"))
#> # A tibble: 1 x 5
#>   commonName officialName                countryCode region borders     
#>   <chr>      <chr>                       <chr>       <chr>  <list>      
#> 1 Germany    Federal Republic of Germany DE          Europe <df [9 x 5]>

# Get the holidays for Germany in 2023
head(nd_holidays(country_code = "DE", year = 2023))
#> # A tibble: 6 x 9
#>   date       localName  name  countryCode fixed global counties launchYear types
#>   <chr>      <chr>      <chr> <chr>       <lgl> <lgl>  <list>        <int> <lis>
#> 1 2023-01-01 Neujahr    New ~ DE          TRUE  TRUE   <NULL>         1967 <chr>
#> 2 2023-01-06 Heilige D~ Epip~ DE          TRUE  FALSE  <chr>          1967 <chr>
#> 3 2023-03-08 Internati~ Inte~ DE          TRUE  FALSE  <chr>          2019 <chr>
#> 4 2023-04-07 Karfreitag Good~ DE          FALSE TRUE   <NULL>           NA <chr>
#> 5 2023-04-09 Ostersonn~ East~ DE          FALSE FALSE  <chr>            NA <chr>
#> 6 2023-04-10 Ostermont~ East~ DE          FALSE TRUE   <NULL>         1642 <chr>
```
