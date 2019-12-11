#' teamData
#'
#' This function allows R users to get season statistics for a specified team and
#' season in the English Premier League. The data is retrieved from DataHub.io
#' and covers from 2009 to 2019.
#'
#' The function requires users to input two different arguments. The first argument
#' specifies the EPL Season that he or she wants to retrieve data for. The second argument
#' specifies which team he or she wants to get data for.
#'
#' @param season
#' The season argument allows the user to specify for which season he or she wants to get EPL data.
#' Ensure that season is in the correct character string format, e.g. "1819" for 2018 - 2019 Season
#' and "1718" for 2017 - 2018 season.
#' @param team
#' The team argument requires the user to specify the team he or she wants the data for. The first letter
#' of the team name should be capitalized or if the team is name is 2 words, e.g. Man United - you should
#' capitalize the first letter of both words.
#' @import dplyr
#' @export
#' @return A dataframe with summary season statistics for the specified team and season.
#' @examples
#' teamData(season = "1819", team = "Liverpool")
#' teamData("1617", "Man United")

teamData <- function(season, team) {

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

  teamStats <- dataPull %>%
    dplyr::filter(HomeTeam == team | AwayTeam == team) %>%
    dplyr::select(Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR, HTHG, HTAG, HTR, Referee,
                  HS, AS, HST, AST, HF, AF, HC, AC, HY, AY, HR, AR)
  row <- nrow(teamStats)

  if(team %in% teamStats$HomeTeam | team %in% teamStats$AwayTeam) {
  } else {
    stop("The team you have specified has not been found in the dataframe. Check spelling and ensure that you have used quotation marks for team argument.")
  }

  for (i in 1:row) {
    if(teamStats$FTR[i] == "H") {
      teamStats$winner[i] <- teamStats$HomeTeam[i]
    } else if(teamStats$FTR[i] == "A") {
      teamStats$winner[i] <- teamStats$AwayTeam[i]
    } else {
      teamStats$winner[i] <- "Draw"
    }
  }
  Team <- team
  Season <- season
  Win <- sum(teamStats$winner == team)
  Draw <-sum(teamStats$winner == "Draw")
  Loss <- row - (Win + Draw)
  Games <- row
  data.frame(Team, Season, Games, Win, Draw, Loss)
}
