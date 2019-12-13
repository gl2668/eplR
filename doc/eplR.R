## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(eplR)

## -----------------------------------------------------------------------------
# Get Data for season 2009/2010
head(eplData[[8]])

## -----------------------------------------------------------------------------
# Query Data
head(getData(1617, bet = FALSE, team = "Liverpool"))

## -----------------------------------------------------------------------------
# Get Referee stats for 2013-2014 season
head(referee(1314))

## -----------------------------------------------------------------------------
teamData(1112, "Wolves")

## -----------------------------------------------------------------------------
# Look at the performance of Man City and Man United in the 2018-2019 season
teamPerformance(1819, "Man City")
teamPerformance(1819, "Man United")

