##*
##*Fantasy Football Prediction
##*Ryan Vackner 
##*July 21th, 2022
##*
##*
library(readr)
library(stargazer)
library(jtools)
library(ggplot2)
library(RCurl)


#url of the csv file
url16 = "https://raw.githubusercontent.com/ryantvackner/fantasy-football-prediction/main/FF16.csv"
url17 = "https://raw.githubusercontent.com/ryantvackner/fantasy-football-prediction/main/FF17.csv"
url18 = "https://raw.githubusercontent.com/ryantvackner/fantasy-football-prediction/main/FF18.csv"
url19 = "https://raw.githubusercontent.com/ryantvackner/fantasy-football-prediction/main/FF19.csv"
url20 = "https://raw.githubusercontent.com/ryantvackner/fantasy-football-prediction/main/FF20.csv"
url21 = "https://raw.githubusercontent.com/ryantvackner/fantasy-football-prediction/main/FF21.csv"

#read csv file from github
df16 = read.csv(url16, header = TRUE)
df17 = read.csv(url17, header = TRUE)
df18 = read.csv(url18, header = TRUE)
df19 = read.csv(url19, header = TRUE)
df20 = read.csv(url20, header = TRUE)
df21 = read.csv(url21, header = TRUE)

# merge all dataframes by Player
df <- merge(merge(merge(merge(merge(
  df16,
  df17, by = "Player"),
  df18, by = "Player"),
  df19, by = "Player"),
  df20, by = "Player"),
  df21, by = "Player")

#*
#* Note:
#* This dataframe now only includes players who have fantasy points 
#* from the year 2016 until 2022. This is useful for looking at 
#* data of players for the long term. But now we only have 145
#* observations and most players in the league don't play for that 
#* long. 
#* 
#* We want to look at all players on a year to year basis to see if 
#* there previous years performance is indicative of the upcoming
#* year.
#* 

# merge dataframes year by year
df16_17 <- merge(df16, df17, by = "Player")
df17_18 <- merge(df17, df18, by = "Player")
df18_19 <- merge(df18, df19, by = "Player")
df19_20 <- merge(df19, df20, by = "Player")
df20_21 <- merge(df20, df20, by = "Player")

# change the names of the variables in the new dataframes to combine them

