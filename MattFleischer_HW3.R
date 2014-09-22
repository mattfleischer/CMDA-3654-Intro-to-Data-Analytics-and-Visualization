#There was a discrepancy in dataset choice within our group that will
#be amended soon. For the purposes of this assignment, I am using total
#offense data for all Division 1 College Football teams for the 2013
#season as provided by espn.com.

setwd('C://Users//Matthew//Documents//CMDA 3654 - Intro to Data Analytics and Visualization//R//Datasets')
footballdata = read.table('College Football Offense.csv', sep = ',', header = T)
footballdata
summary(footballdata$YDS)
#no problems there#
summary(footballdata$YDS.G)
#seems fine as well#
summary(footballdata$PASS)
#seems good
summary(footballdata$P.YDS.G)
#also seems good
summary(footballdata$RUSH)
#seems good
summary(footballdata$R.YDS.G)
#seems fairly normal
summary(footballdata$PTS)
#seems about right
summary(footballdata$PTS.G)
#also good
summary(footballdata$CONFERENCE)

#All variables appear to be fairly normally distributed, and there are no
#NA's in the dataset to worry about.

library(ggplot2)

#Histograms of primary factors and response
ggplot(footballdata) +
  geom_histogram(aes(x=P.YDS.G),
                 binwidth = 25) +
  theme_bw()

ggplot(footballdata) +
  geom_histogram(aes(x=R.YDS.G),
                 binwidth = 25) +
  theme_bw()

ggplot(footballdata) +
  geom_histogram(aes(x=YDS.G),
                 binwidth = 50) +
  theme_bw()

ggplot(footballdata) +
  geom_histogram(aes(x=PTS.G),
                 binwidth = 5) +
  theme_bw()
#All these histograms indicate a normal distribution.

#Scatterplots
ggplot(footballdata, aes(x=R.YDS.G,y=PTS.G)) +
  geom_point(aes(colour = CONFERENCE )) +
  ylim(0,100) +
  theme_bw() +
  ggtitle("Scatterplot of Rush Yards Per Game vs. Points Per Game")

ggplot(footballdata, aes(x=P.YDS.G,y=PTS.G)) +
  geom_point(aes(colour = CONFERENCE )) +
  ylim(0,100) +
  theme_bw() +
  ggtitle("Scatterplot of Pass Yards Per Game vs. Points Per Game")

ggplot(footballdata, aes(x=YDS.G,y=PTS.G)) +
  geom_point() +
  ylim(0,100) +
  theme_bw() +
  ggtitle("Scatterplot of Yards Per Game vs. Points Per Game")

ggplot(footballdata, aes(x=YDS.G,y=PTS.G)) +
  geom_point(aes(colour = CONFERENCE )) +
  ylim(0,100) +
  theme_bw() +
  ggtitle("Scatterplot of Yards Per Game vs Points Per Game")

#All these graphs indicate a positive relationship between yards per game
#and points per game
ggplot(footballdata, aes(x=YDS.G, y=PTS.G)) + geom_hex(binwidth=c(50,5)) +
  ggtitle("Hexbin Plot of Yards Per Game Versus Points Per Game")