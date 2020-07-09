library(RSQLite)
library(DBI)
library(tidyverse)
library(lubridate)
setwd("~/Projects/acipenser/nfl_bets")

# LOAD TOTAL DATA FROM DB
# con = dbConnect(RSQLite::SQLite(),
#                 dbname = "nfl.db")
# tbls = dbListTables(con)
# stadiums = as_tibble(dbGetQuery(con, "SELECT * FROM stadiums;"))
# teams = as_tibble(dbGetQuery(con, "SELECT * FROM TEAMS;"))
# scores = as_tibble(dbGetQuery(con, "SELECT * FROM scores;"))
# team_key = as_tibble(dbGetQuery(con, "SELECT * FROM TEAM_ABBREV;"))
# dbDisconnect(con)

# -------------------------------------------------------------------------------
# TODO:
#     + stratified sample training and test by schedule season & schedule week
#     + lag win percentage (last 5/10/20 games)
#     + distance away team has traveled 
#     + predictors = something available prior to kickoff!
#     + join stadium to scores by season yr & home team
#     + calculate distance away team traveled as new predictor
#     + calculate lag win percentages for both teams
# -------------------------------------------------------------------------------

# GB TOY DATA - **FIRST MODEL YEAR = 2010**
# IMPORT TOY DATASET
dbpath = "C:\\Users\\danwa\\Documents\\Projects\\acipenser\\nfl_bets\\nfl.db"
con = dbConnect(RSQLite::SQLite(), dbname = dbpath)
gb08 = as_tibble(dbGetQuery(con, "SELECT S.*
                                  FROM SCORES S
                                  WHERE S.SCHEDULE_SEASON = '2008'
                                  AND (S.team_home = 'Green Bay Packers' OR 
                                       S.team_away = 'Green Bay Packers')
                                  AND SCHEDULE_WEEK <> 'Division';"))

gb09 = as_tibble(dbGetQuery(con, "SELECT S.*
                                  FROM SCORES S
                                  WHERE S.SCHEDULE_SEASON = '2009'
                                  AND (S.team_home = 'Green Bay Packers' OR 
                                       S.team_away = 'Green Bay Packers')
                                  AND SCHEDULE_WEEK <> 'Division';"))

gb10 = as_tibble(dbGetQuery(con, "SELECT S.*
                                  FROM SCORES S
                                  WHERE S.SCHEDULE_SEASON = '2010'
                                  AND (S.team_home = 'Green Bay Packers' OR 
                                       S.team_away = 'Green Bay Packers')
                                  AND SCHEDULE_WEEK <> 'Division';"))
gb11 = as_tibble(dbGetQuery(con, "SELECT S.*
                                  FROM SCORES S
                                  WHERE S.SCHEDULE_SEASON = '2011'
                                  AND (S.team_home = 'Green Bay Packers' OR 
                                       S.team_away = 'Green Bay Packers')
                                  AND SCHEDULE_WEEK <> 'Division';"))
gb = as_tibble(dbGetQuery(con, "SELECT * FROM GB08_11;"))
dbDisconnect(con)

# CREATE LAG VARIABLE


# -------------------------------------------------------------------------------
# CODE STORAGE
# -------------------------------------------------------------------------------

# scores %>% 
#   mutate(schedule_date = as_date(mdy(schedule_date), "%m/%d/%y")) %>% 
#   # filter for non-playoff games this decade
#   filter(schedule_date >= as_date(mdy("07/01/2010")) & schedule_playoff == FALSE) %>% 
#   #2,659 games since 10-11 season, 2,550 non-playoff
#   select(team_home, team_favorite_id) %>% 
#   distinct(team_home) -> team_full_names
# scores %>% 
#   mutate(schedule_date = as_date(mdy(schedule_date), "%m/%d/%y")) %>% 
#   # filter for non-playoff games this decade
#   filter(schedule_date >= as_date(mdy("07/01/2010")) & schedule_playoff == FALSE) %>% 
#   #2,659 games since 10-11 season, 2,550 non-playoff
#   select(team_home, team_favorite_id) %>% 
#   distinct(team_favorite_id) -> team_ids
# out = cbind(team_full_names, team_ids)
# write_csv(out, "~/Projects/acipenser/nfl_bets/nfl-scores-and-betting-data/data/team_names_and_ids.csv")  
  
  
  
  

  



