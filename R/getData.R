#' getData
#'
#' This function allows R users to retrieve match statistics and betting odds for
#' English Premier League games over the past decade.
#' The data is retrieved from DataHub.io
#'
#' The function allows the user to input three arguments. The first argument is season,
#' which specifies the EPL Season that the user wants to retrieve data for. The second
#' argument is bet, which specifies whether the user wants to retrieve additional betting
#' odds data for the matches. The third argument is team, which specifies whether the user
#' wants to retrieve data only for a particular team.
#'
#' @param season
#' The season argument allows the user to specify for which season he or she wants to get EPL
#'  data for. Ensure that season is in the correct character string format,
#'  e.g. "1819" for 2018 - 2019 Season; and "1718" for 2017 - 2018 season.
#' @param bet
#' The bet argument allows the user to specify whether he or she wants to retrieve betting data.
#' The default setting for bet is TRUE. If the user only wants the match statistics, set bet to FALSE.
#' @param team
#' The team argument allows the user to filter the data to find match statistics and betting data
#' that he or she is only interested in. The default stting is "all", which retrieves data for all teams
#' in the English Premier league for the specified season. If the user wants to look at only one specific team
#' he or she can use this argument. Ensure that team name is in correct character string format, e.g. "Chelsea" or "Man City".
#' @import dplyr
#' @export
#' @return A dataframe with match statistics and / or betting odds for the specified Season.
#' @examples
#' getData(season = "1819", bet = FALSE, team = "Arsenal")
#' getData(season = "1617", bet = TRUE, team = "Chelsea")
#' getData(season = "1415")

getData <- function(season, bet = TRUE, team = "all") {

  if(season == "0910") {
    season_query <- 1
  } else if (season == "1011") {
    season_query <- 2
  } else if (season == "1112") {
    season_query <- 3
  } else if (season == "1213") {
    season_query <- 4
  } else if (season == "1314") {
    season_query <- 5
  } else if (season == "1415") {
    season_query <- 6
  } else if (season == "1516") {
    season_query <- 7
  } else if (season == "1617") {
    season_query <- 8
  } else if (season == "1718") {
    season_query <- 9
  } else if (season == "1819") {
    season_query <- 10
  } else {
    stop("Error. Season not found. Please check argument.")
  }

  dataPull <- eplData[[season_query]]

  if(bet == TRUE) {
    dataPull <- dataPull
  } else {
    dataPull <- dataPull %>%
      dplyr::select(Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR, HTHG, HTAG, HTR, Referee,
                    HS, AS, HST, AST, HF, AF, HC, AC, HY, AY, HR, AR)
  }

  if(team == "all") {
    dataPull <- dataPull
  } else {
    team <- team
    dataPull <- dataPull %>%
      dplyr::filter(HomeTeam == team | AwayTeam == team)
  }
  dataPull
}
