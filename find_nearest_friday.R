# ------------------------------------------- #
# -- FIND NEAREST FRIDAY FOR ALL NFL GAMES -- #
# --            2 MAR 2020                 -- #
# ------------------------------------------- #


library(tidyverse)
library(lubridate)
library(RSQLite)

# FUNCTION TO FIND LAST FRIDAY
lastfri <- function(x) {
  7 * floor(as.numeric(x-5+4)/7) + as.Date(5-4, origin="1970-01-01")
}




dbpath = "C:\\Users\\danwa\\Documents\\Projects\\acipenser\\nfl_bets\\nfl.db"
con = dbConnect(RSQLite::SQLite(), dbname = dbpath)
gb = as_tibble(dbGetQuery(con, "SELECT * FROM GB08_11;"))
dbDisconnect(con)



# DPLYR - LUBRIDATE - FIND NEAREST FRIDAY FOR ALL GAMES
gb = as_tibble(gb)
gb %>% mutate(schedule_date = as_date(parse_date_time(schedule_date, c('mdy'))),
              schedule_season = as.integer(schedule_season),
              schedule_week = as.integer(schedule_week),
              schedule_playoff = as.logical(schedule_playoff),
              score_home = as.integer(score_home),
              score_away = as.integer(score_away),
              team_favorite_id = as.factor(team_favorite_id),
              spread_favorite = as.numeric(spread_favorite),
              over_under_line = as.numeric(over_under_line),
              stadium_neutral = as.logical(stadium_neutral),
              weather_temperature = as.numeric(weather_temperature),
              weather_wind_mph = as.numeric(weather_wind_mph),
              weather_humidity = as.numeric(weather_humidity),
              HOME_FLAG = as.integer(HOME_FLAG),
              FAVORITE_FLAG = as.integer(FAVORITE_FLAG),
              GB_SCORE = as.integer(GB_SCORE),
              OPP_SCORE = as.integer(OPP_SCORE),
              TOTAL_SCORE = as.integer(TOTAL_SCORE)) -> gb
gb$PREV_FRI = lastfri(gb$schedule_date)  

