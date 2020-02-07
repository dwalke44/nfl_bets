library(RSQLite)
library(DBI)
library(tidyverse)
setwd("~/Projects/acipenser/nfl_bets")

con = dbConnect(RSQLite::SQLite(),
                dbname = "nfl.db")
tbls = dbListTables(con)
stadiums = as_tibble(dbGetQuery(con, "SELECT * FROM stadiums;"))
teams = as_tibble(dbGetQuery(con, "SELECT * FROM TEAMS;"))
scores = as_tibble(dbGetQuery(con, "SELECT * FROM spreadspoke_scores;"))
dbDisconnect(con)
