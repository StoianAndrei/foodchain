#' Inverted versions of in, is.null and is.na
#' 
#' @noRd
#' 
#' @examples
#' 1 %not_in% 1:10
#' not_null(NULL)
`%not_in%` <- Negate(`%in%`)

not_null <- Negate(is.null)

not_na <- Negate(is.na)

#' Removes the null from a vector
#' 
#' @noRd
#' 
#' @example 
#' drop_nulls(list(1, NULL, 2))
drop_nulls <- function(x){
  x[!sapply(x, is.null)]
}

#' If x is `NULL`, return y, otherwise return x
#' 
#' @param x,y Two elements to test, one potentially `NULL`
#' 
#' @noRd
#' 
#' @examples
#' NULL %||% 1
"%||%" <- function(x, y){
  if (is.null(x)) {
    y
  } else {
    x
  }
}

#' If x is `NA`, return y, otherwise return x
#' 
#' @param x,y Two elements to test, one potentially `NA`
#' 
#' @noRd
#' 
#' @examples
#' NA %||% 1
"%|NA|%" <- function(x, y){
  if (is.na(x)) {
    y
  } else {
    x
  }
}

#' Typing reactiveValues is too long
#' 
#' @inheritParams reactiveValues
#' @inheritParams reactiveValuesToList
#' 
#' @noRd
rv <- shiny::reactiveValues
rvtl <- shiny::reactiveValuesToList


#' Processing data
#' 
#' @.data listed_beekeepers
get_listed_beekeepers <- function(.data = NULL) 
{
  message("  Make sure you have the data loaded ", glimpse(.data))
  if(.data != NULL){
    code <- tibble::as_tibble(listed_beekeepers) %>% 
      janitor::clean_names() %>% 
      dplyr::mutate(listing_date = lubridate::dmy(listing_date),
                    expiry_date  = lubridate::dmy(expiry_date )
                    ) %>% 
      filter(!is.na(physical_address)) %>%  
      dplyr::mutate(name = str_trim(str_remove(name,"Limited"),"both")) %>% 
      dplyr::mutate(town = str_extract(physical_address,"[A-Z]+$")) %>%
      tidyte
      dplyr::mutate(town = ifelse(is.na(town),yes = str_extract(physical_address,"[A-Z]+"),no = town)) %>% 
      filter(!is.na(town)) 
      
  }
}
