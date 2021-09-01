## code to prepare `listed_beekeepers` dataset goes here 
listed_beekeepers <- readr::read_csv(file = "data-raw/listed_beekeepers.csv")

usethis::use_data(listed_beekeepers, overwrite = TRUE)
