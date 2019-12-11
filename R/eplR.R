#' \code{eplR} package
#'
#' The goal of eplR is to make it easy for any user of R to access and analyze data from the
#' English Premier League (soccer). The package provides R functions that simplify and expedite
#' common tasks for studying match, referee and betting statistics in the league.
#'
#' See the README on
#' \href{https://github.com/gl2668/eplR/blob/master/README.md}{GitHub}
#'
#' @docType package
#' @name eplR
NULL

## Suppress concerns of R CMD check re: the variables that appear in pipelines
utils::globalVariables(c("Date", "HomeTeam","AwayTeam","FTHG", "FTAG", "FTR", "HTHG", "HTAG", "HTR",
                         "Referee", "HS", "AS", "HST", "AST", "HF", "AF", "HC", "AC", "HY", "AY", "HR",
                         "AR", "B365H", "B365D", "B365A", "BWH", "BWD", "BWA", "IWH", "IWD", "IWA", "WHH",
                         "WHD", "WHA", "VCH", "VCD", "VCA", "eplData", "HomeTeamFouls", "AwayTeamFouls",
                         "AvgFouls", "AvgRedCards", "AvgYellowCards", "AwayTeamFouls", "AwayTeamRed",
                         "AwayTeamYellow", "HomeTeamRed", "HomeTeamYellow", "cummulative_points", "eplData",
                         "points"))
