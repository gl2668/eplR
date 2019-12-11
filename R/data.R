#' @title Match statistics and Betting data for English Premier League (soccer) Games
#'
#' @description The dataset is a list of 10 dataframes covering EPL data from seasons 2009-2010 to 2018-2019. The data is retrieved from DataHub.io.
#'
#' @usage eplData
#' @format A list of 10 data frames with 380 observations and 37 variables each:
#' \describe{
#'   \item{Date}{Date, in 'yyyy-mm-dd'}
#'   \item{HomeTeam}{Home Team Football Club}
#'   \item{AwayTeam}{Away Team Football Club}
#'   \item{FTHG}{Full Time Home Goals}
#'   \item{FTAG}{Full Time Away Goals}
#'   \item{FTR}{Full Time Results}
#'   \item{HTHG}{Half Time Home Goals}
#'   \item{HTAG}{Half Time Away Goals}
#'   \item{HTR}{Half TIme Results}
#'   \item{Referee}{Referee}
#'   \item{HS}{Home Team Shots}
#'   \item{AS}{Away Team Shots}
#'   \item{HST}{Home Team Shots on Target}
#'   \item{AST}{Away Team Shots on Target}
#'   \item{HF}{Home Team Fouls}
#'   \item{AF}{Away Team Fouls}
#'   \item{HC}{Home Team Corners}
#'   \item{AC}{Away Team Corners}
#'   \item{HY}{Home Team Yellow Cards}
#'   \item{AY}{Away Team Yellow Cards}
#'   \item{HR}{Home Team Red Cards}
#'   \item{AR}{Away Team Red Cards}
#'   \item{B365H}{Bet365 Home Team Win Odds}
#'   \item{B365D}{Bet365 Draw Odds}
#'   \item{B365A}{Bet365 Away Team Win Odds}
#'   \item{BWH}{Bet&Win Home Team Win Odds}
#'   \item{BWD}{Bet&Win Draw Odds}
#'   \item{BWA}{Bet&Win Away Team Win Odds}
#'   \item{IWH}{Interwetten Home Team Win Odds}
#'   \item{IWD}{Interwetten Draw Odds}
#'   \item{IWA}{Interwetten Away Team Win Odds}
#'   \item{WHH}{William Hill Home Team Win Odds}
#'   \item{WHD}{William Hill Draw Odds}
#'   \item{WHA}{William Hill Away Team Win Odds}
#'   \item{VCH}{VC Bet Home Team Win Odds}
#'   \item{VCD}{VC Bet Draw Odds}
#'   \item{VCA}{VC Bet Away Team Win Odds}
#' }
#' @source \url{https://datahub.io/sports-data/english-premier-league#readme}
"eplData"
