# data-raw/eplData.R
# Data Import and Processing Script

library(dplyr)
library(httr)
library(jsonlite)

# Retrieve Data from Football-Data
retrieveFBD <- function(season) {
  apiRequestLinkFBD <- paste0("http://www.football-data.co.uk/mmz4281/", season, "/E0.csv")
  seasonDataFBD <- httr::GET(apiRequestLinkFBD)
  if(httr::http_error(seasonDataFBD)) {
    warning("The request has produced an error. Check Function Parameter.")
  } else {
    apiResponseFBD <- httr::content(seasonDataFBD)
  }
  apiResponseFBD %>%
    dplyr::select(Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR, HTHG, HTAG, HTR, Referee,
                  HS, AS, HST, AST, HF, AF, HC, AC, HY, AY, HR, AR, B365H, B365D, B365A,
                  IWH, IWD, IWA, WHH, WHD, WHA) %>%
    as.data.frame()
}

listOfSeasonsFBD <- list("0203", "0304", "0405", "0506", "0607", "0708", "0809")

eplDataFBD <- list()
for(i in listOfSeasonsFBD[1:7]) {
  data <- retrieveFBD(i)
  name <- paste0(i, "data")
  eplDataFBD[[name]] <- data
}


# Retrieve Data from Data-Hub
retrieveDH <- function(season) {
  apiRequestLinkDH <- paste0("https://datahub.io/sports-data/english-premier-league/r/season-", season, ".json")
  seasonDataDH <- httr::GET(apiRequestLinkDH)
  if(httr::http_error(seasonDataDH)) {
    warning("The request has produced an error. Check Function Parameter.")
  } else {
    apiResponseDH <- jsonlite::fromJSON(httr::content(seasonDataDH, "text"))
  }
  apiResponseDH %>%
    dplyr::select(Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR, HTHG, HTAG, HTR, Referee,
                  HS, AS, HST, AST, HF, AF, HC, AC, HY, AY, HR, AR, B365H, B365D, B365A,
                  IWH, IWD, IWA, WHH, WHD, WHA)
}

listOfSeasonsDH <- list("0910", "1011", "1112", "1213", "1314", "1415", "1516", "1617", "1718", "1819")

eplDataDH <- list()
for(i in listOfSeasonsDH[1:10]) {
  data <- retrieveDH(i)
  name <- paste0(i, "data")
  eplDataDH[[name]] <- data
}

eplData <- append(eplDataFBD, eplDataDH)

usethis::use_data(eplData, overwrite = T)
