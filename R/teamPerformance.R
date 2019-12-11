#' teamPerformance
#'
#' This function allows R users to visualize the performance of a specified team in the English Premier League over a specified season.
#'
#' The function requires the user to input two arguments. The first argument is the season and the second
#' argument is the team.
#'
#' @param season
#' The season argument allows the user to specify for which season he or she wants to get EPL
#  data for. Ensure that season is in the correct character string format,
#' e.g. "1819" for 2018 - 2019 Season; and "1718" for 2017 - 2018 season.
#' @param team
#' The team argument allows the user to filter the data to visualize the season performance of the team
#' that the user is only interested in. Ensure that team name is in correct character string format, e.g. "Chelsea" or "Man City".
#' @import dplyr
#' @import ggplot2
#' @importFrom lubridate dmy
#' @export
#' @return A plot of the specified team's cummulated points over the specified Season.
#' @examples
#' teamPerformance(season = "1819", team = "Arsenal")
#' teamPerformance(season = "1617", "Chelsea")
#' teamPerformance(1112, "Wolves")

teamPerformance <- function(season, team) {

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

  teamPerformance <- dataPull %>%
    dplyr::filter(HomeTeam == team | AwayTeam == team) %>%
    dplyr::select(Date, HomeTeam, AwayTeam, FTR)

  row <- nrow(teamPerformance)

  if(team %in% teamPerformance$HomeTeam | team %in% teamPerformance$AwayTeam) {
  } else {
    stop("The team you have specified has not been found in the dataframe. Check spelling and ensure that you have used quotation marks for team argument.")
  }

  for (i in 1:row) {
    if(teamPerformance$FTR[i] == "H") {
      teamPerformance$winner[i] <- teamPerformance$HomeTeam[i]
    } else if(teamPerformance$FTR[i] == "A") {
      teamPerformance$winner[i] <- teamPerformance$AwayTeam[i]
    } else {
      teamPerformance$winner[i] <- "Draw"
    }
  }
  teamPerformance %>%
    dplyr::mutate(Date = lubridate::dmy(Date)) %>%
    dplyr::mutate(points = case_when(winner == team ~ 3,
                                     winner == "Draw" ~ 1,
                                     winner != team ~ 0)) %>%
    dplyr::mutate(cummulative_points = cumsum(points)) %>%
    ggplot2::ggplot(aes(Date, cummulative_points)) +
    ggplot2::geom_line() +
    ggplot2::scale_x_date(date_breaks = "2 month", date_labels = "%d/%m") +
    ggplot2::labs(x = "",
         y = "Points Tally",
         title = paste("Points tally for", team, "over", season, "season"))
}
