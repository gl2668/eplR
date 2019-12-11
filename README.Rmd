---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->

```{r, include = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)
```

# eplR
***

<!-- badges: start -->
<!-- badges: end -->

The goal of eplR is to make it easy for any user of R to access and analyze data from the English Premier League (soccer). The package provides R functions that simplify and expedite common tasks for studying match, referee and betting statistics in the league.

## Installation
***

You can install the released version of eplR from [Github](https://github.com/gl2668/eplR) with:

``` r
# Install eplR from Github
install.packages("devtools")
devtools::install_github("gl2668/eplR")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("QMSS-G5072-2019/Lee_Gerald")
```
## Usage
***

#### Data that comes with the package

The `eplR` package comes with a built in dataset for 10 seasons of English Premier League (soccer) games. They are from 2009/2010 to 2018/2019. To call on the dataset just use call `eplData`. The format of `eplData` is a list of dataframes so to get the dataframe for 2009/2010 season use the following code:

```{r}
# Get Data for season 2009/2010
eplData[[1]]
```

***

#### Specific Data Query

For an easier version to query the data. You can use the `getData()` function. This function allows you to specify the season, whether you want additional betting information and whether you only want to have season data for a specific team.

```{r}
# Query Data
getData(1617, bet = FALSE, team = "Liverpool")
```

***

#### Referee Data

For users who are interested in analysing the season statistics for referees, you can use the `referee()` function, which will output a specialized query for referee-related information.

```{r}
# Get Referee stats for 2013-2014 season
referee(1314)
```

***

#### Team Data

To get summary statistics for a particular team during a particular season, use the `teamData()` function.

```{r}
teamData(1112, "Wolves")
```

***

#### Team Performance

To visualize the performance of a team over the course of a particular season, use the `teamPerformance()` function.

```{r}
# Look at the performance of Man City and Man United in the 2018-2019 season
teamPerformance(1819, "Man City")
teamPerformance(1819, "Man United")
```

