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

# print the names of the coloums in the dataframes
names(df16_17)

# change the names of the variables in the new dataframes to combine them
colnames(df16_17) <- c("Player", "Position", "Age", "Games", "Pass.Cmp", "Pass.Att",
                       "Pass.Yds", "Pass.TD", "Pass.Int", "Rush.Att", "Rush.Yds", "Rush.TD", 
                       "Rec.Tgt", "Rec", "Rec.Yds", "Rec.TD", "Fmb", "Tot.TD", 
                       "FantPt", "PPR", "newPosition", "newAge", "newGames", "newPass.Cmp",
                       "newPass.Att", "newPass.Yds", "newPass.TD", "newPass.Int", "newRush.Att", "newRush.Yds",
                       "newRush.TD", "newRec.Tgt", "newRec", "newRec.Yds", "newRec.TD", "newFmb",    
                       "newTot.TD", "newFantPt", "newPPR")
colnames(df17_18) <- c("Player", "Position", "Age", "Games", "Pass.Cmp", "Pass.Att",
                       "Pass.Yds", "Pass.TD", "Pass.Int", "Rush.Att", "Rush.Yds", "Rush.TD", 
                       "Rec.Tgt", "Rec", "Rec.Yds", "Rec.TD", "Fmb", "Tot.TD", 
                       "FantPt", "PPR", "newPosition", "newAge", "newGames", "newPass.Cmp",
                       "newPass.Att", "newPass.Yds", "newPass.TD", "newPass.Int", "newRush.Att", "newRush.Yds",
                       "newRush.TD", "newRec.Tgt", "newRec", "newRec.Yds", "newRec.TD", "newFmb",    
                       "newTot.TD", "newFantPt", "newPPR")
colnames(df18_19) <- c("Player", "Position", "Age", "Games", "Pass.Cmp", "Pass.Att",
                       "Pass.Yds", "Pass.TD", "Pass.Int", "Rush.Att", "Rush.Yds", "Rush.TD", 
                       "Rec.Tgt", "Rec", "Rec.Yds", "Rec.TD", "Fmb", "Tot.TD", 
                       "FantPt", "PPR", "newPosition", "newAge", "newGames", "newPass.Cmp",
                       "newPass.Att", "newPass.Yds", "newPass.TD", "newPass.Int", "newRush.Att", "newRush.Yds",
                       "newRush.TD", "newRec.Tgt", "newRec", "newRec.Yds", "newRec.TD", "newFmb",    
                       "newTot.TD", "newFantPt", "newPPR")
colnames(df19_20) <- c("Player", "Position", "Age", "Games", "Pass.Cmp", "Pass.Att",
                       "Pass.Yds", "Pass.TD", "Pass.Int", "Rush.Att", "Rush.Yds", "Rush.TD", 
                       "Rec.Tgt", "Rec", "Rec.Yds", "Rec.TD", "Fmb", "Tot.TD", 
                       "FantPt", "PPR", "newPosition", "newAge", "newGames", "newPass.Cmp",
                       "newPass.Att", "newPass.Yds", "newPass.TD", "newPass.Int", "newRush.Att", "newRush.Yds",
                       "newRush.TD", "newRec.Tgt", "newRec", "newRec.Yds", "newRec.TD", "newFmb",    
                       "newTot.TD", "newFantPt", "newPPR")
colnames(df20_21) <- c("Player", "Position", "Age", "Games", "Pass.Cmp", "Pass.Att",
                       "Pass.Yds", "Pass.TD", "Pass.Int", "Rush.Att", "Rush.Yds", "Rush.TD", 
                       "Rec.Tgt", "Rec", "Rec.Yds", "Rec.TD", "Fmb", "Tot.TD", 
                       "FantPt", "PPR", "newPosition", "newAge", "newGames", "newPass.Cmp",
                       "newPass.Att", "newPass.Yds", "newPass.TD", "newPass.Int", "newRush.Att", "newRush.Yds",
                       "newRush.TD", "newRec.Tgt", "newRec", "newRec.Yds", "newRec.TD", "newFmb",    
                       "newTot.TD", "newFantPt", "newPPR")

# merge all two year dataframes into one large dataframe with rbind
mydat <- rbind(df16_17, df17_18, df18_19, df19_20, df20_21)

#*
#* Note:
#* Now because we are looking at the data year over year of the players
#* I have 2456 observations with mydat. There are players who are seen in 
#* multiple rows but this isn't a problem since it is comparing two different
#* years of the same player. 
#* 

# Creating subsets of my new mydat dataframe
mydatqb <- mydat[which(mydat$Position == "QB"),]
mydatrb <- mydat[which(mydat$Position == "RB"),]
mydatwr <- mydat[which(mydat$Position == "WR"),]
mydatte <- mydat[which(mydat$Position == "TE"),]

# Plots!
# plots for qb
plot(x = mydatqb$Age, y = mydatqb$PPR, xlab = "Age", ylab = "PPR")
plot(x = mydatqb$Pass.Cmp, y = mydatqb$PPR, xlab = "Pass Completion", ylab = "PPR")
plot(x = mydatqb$Pass.Cmp, y = mydatqb$newPPR, xlab = "Pass Completion", ylab = "Next Year PPR")
plot(x = mydatqb$Pass.Yds, y = mydatqb$PPR, xlab = "Pass Yards", ylab = "PPR")
plot(x = mydatqb$Pass.Yds, y = mydatqb$newPPR, xlab = "Pass Yards", ylab = "Next Year PPR")
plot(x = mydatqb$Pass.TD, y = mydatqb$PPR, xlab = "Pass TD", ylab = "PPR")
plot(x = mydatqb$Pass.TD, y = mydatqb$newPPR, xlab = "Pass TD", ylab = "Next Year PPR")
plot(x = mydatqb$Pass.Int, y = mydatqb$PPR, xlab = "Interceptions", ylab = "PPR")
plot(x = mydatqb$Pass.Int, y = mydatqb$newPPR, xlab = "Interceptions", ylab = "Next Year PPR")
plot(x = mydatqb$PPR, y = mydatqb$newPPR, xlab = "PPR", ylab = "Next Year PPR")

# plots for rb
plot(x = mydatrb$Age, y = mydatrb$PPR, xlab = "Age", ylab = "PPR")
plot(x = mydatrb$Rush.Yds, y = mydatrb$PPR, xlab = "Rush Yards", ylab = "PPR")
plot(x = mydatrb$Rush.Yds, y = mydatrb$newPPR, xlab = "Rush Yards", ylab = "Next Year PPR")
plot(x = mydatrb$Rush.TD, y = mydatrb$PPR, xlab = "Rush TD", ylab = "PPR")
plot(x = mydatrb$Rush.TD, y = mydatrb$newPPR, xlab = "Rush TD", ylab = "Next Year PPR")
plot(x = mydatrb$Fmb, y = mydatrb$PPR, xlab = "Fumbles", ylab = "PPR")
plot(x = mydatrb$Fmb, y = mydatrb$newPPR, xlab = "Fumbles", ylab = "Next Year PPR")
plot(x = mydatrb$PPR, y = mydatrb$newPPR, xlab = "PPR", ylab = "Next Year PPR")


# plots for wr
plot(x = mydatwr$Age, y = mydatwr$PPR, xlab = "Age", ylab = "PPR")
plot(x = mydatwr$Rec, y = mydatwr$PPR, xlab = "Receptions", ylab = "PPR")
plot(x = mydatwr$Rec, y = mydatwr$newPPR, xlab = "Receptions", ylab = "Next Year PPR")
plot(x = mydatwr$Rec.Yds, y = mydatwr$PPR, xlab = "Receiving Yards", ylab = "PPR")
plot(x = mydatwr$Rec.Yds, y = mydatwr$newPPR, xlab = "Receiving Yards", ylab = "Next Year PPR")
plot(x = mydatwr$Rec.TD, y = mydatwr$PPR, xlab = "Receiving TD", ylab = "PPR")
plot(x = mydatwr$Rec.TD, y = mydatwr$newPPR, xlab = "Receiving TD", ylab = "Next Year PPR")
plot(x = mydatwr$PPR, y = mydatwr$newPPR, xlab = "PPR", ylab = "Next Year PPR")

# plots for te
plot(x = mydatte$Age, y = mydatte$PPR, xlab = "Age", ylab = "PPR")
plot(x = mydatte$Rec, y = mydatte$PPR, xlab = "Receptions", ylab = "PPR")
plot(x = mydatte$Rec, y = mydatte$newPPR, xlab = "Receptions", ylab = "Next Year PPR")
plot(x = mydatte$Rec.Yds, y = mydatte$PPR, xlab = "Receiving Yards", ylab = "PPR")
plot(x = mydatte$Rec.Yds, y = mydatte$newPPR, xlab = "Receiving Yards", ylab = "Next Year PPR")
plot(x = mydatte$Rec.TD, y = mydatte$PPR, xlab = "Receiving TD", ylab = "PPR")
plot(x = mydatte$Rec.TD, y = mydatte$newPPR, xlab = "Receiving TD", ylab = "Next Year PPR")
plot(x = mydatte$PPR, y = mydatte$newPPR, xlab = "PPR", ylab = "Next Year PPR")


