#' referee
#'
#' This function allows R users to get referee statistics for a specified season in the
#' English Premier League. The data is retrieved from DataHub.io and football-data.co.uk.
#' It covers from 2002 to 2019.
#'
#' The function requires users to input one argument. This argument specifies the EPL Season
#' that the user wants to retrieve data for.
#'
#' @param season
#' The season argument allows the user to specify which season he or she wants to get EPL data for.
#' Ensure that season is in the correct character string format, e.g. "1819" for 2018 - 2019 Season
#' and "1718" for 2017 - 2018 season.
#' @import dplyr
#' @export
#' @return A dataframe with season statistics for the specified Season.
#' @examples
#' referee(season = "1819")
#' referee("1617")

referee <- function(season) {

  if(season == "0203") {
    season_query <- 1
  } else if (season == "0304") {
    season_query <- 2
  } else if (season == "0405") {
    season_query <- 3
  } else if (season == "0506") {
    season_query <- 4
  } else if (season == "0607") {
    season_query <- 5
  } else if (season == "0708") {
    season_query <- 6
  } else if (season == "0809") {
    season_query <- 7
  } else if (season == "0910") {
    season_query <- 8
  } else if (season == "1011") {
    season_query <- 9
  } else if (season == "1112") {
    season_query <- 10
  } else if (season == "1213") {
    season_query <- 11
  } else if (season == "1314") {
    season_query <- 12
  } else if (season == "1415") {
    season_query <- 13
  } else if (season == "1516") {
    season_query <- 14
  } else if (season == "1617") {
    season_query <- 15
  } else if (season == "1718") {
    season_query <- 16
  } else if (season == "1819") {
    season_query <- 17
  } else {
    stop("Error. Season not found. Please check season argument.")
  }

  refereeData <- eplData[[season_query]] %>%
    dplyr::select(Date, Referee, HomeTeam, AwayTeam, "HomeTeamFouls" = HF,
                  "AwayTeamFouls" = AF, "HomeTeamYellow" = HY, "AwayTeamYellow" = AY,
                  "HomeTeamRed" = HR, "AwayTeamRed" = AR) %>%
    dplyr::group_by(Referee) %>%
    dplyr::summarise(AvgFouls = round(mean(HomeTeamFouls + AwayTeamFouls), 1),
                     AvgYellowCards = round(mean(HomeTeamYellow + AwayTeamYellow), 1),
                     AvgRedCards = round(mean(HomeTeamRed + AwayTeamRed), 1))

  Games <- eplData[[season_query]] %>%
    dplyr::group_by(Referee) %>%
    tally %>%
    select(n)

  refereeData <- cbind(refereeData, Games) %>%
    dplyr::select(Referee, AvgFouls, AvgYellowCards, AvgRedCards, "Matches" = n) %>%
    dplyr::arrange(desc(AvgFouls))

  refereeData
}
