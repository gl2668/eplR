# data-raw/eplData.R
# Data Import and Processing Script

library(dplyr)
library(httr)
library(jsonlite)

getData <- function(season) {
  apiRequestLink <- paste0("https://datahub.io/sports-data/english-premier-league/r/season-", season, ".json")
  seasonData <- httr::GET(apiRequestLink)
  if(httr::http_error(seasonData)) {
    warning("The request has produced an error. Check Function Parameter.")
  } else {
    apiResponse <- jsonlite::fromJSON(httr::content(seasonData, "text"))
  }
  apiResponse %>%
    dplyr::select(Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR, HTHG, HTAG, HTR, Referee,
                  HS, AS, HST, AST, HF, AF, HC, AC, HY, AY, HR, AR, B365H, B365D, B365A, BWH,
                  BWD, BWA, IWH, IWD, IWA, WHH, WHD, WHA, VCH, VCD, VCA)
}

listOfSeasons <- list("0910", "1011", "1112", "1213", "1314", "1415", "1516", "1617", "1718", "1819")

eplData <- list()
for(i in listOfSeasons[1:10]) {
  data <- getData(i)
  name <- paste0(i, "data")
  eplData[[name]] <- data
}

usethis::use_data(eplData, overwrite = T)
