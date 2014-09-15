setwd("C:\\Users\\Matthew\\Documents\\CMDA 3654 - Intro to Data Analytics and Visualization\\R\\Datasets")
load('exampledata.rData')
names(custdata)
dim(custdata)
summary(custdata)
summary(custdata$is.employed)
#328 NA's proves problematic for binary data
summary(custdata$income)
#The minimum income being negative is a probelm - could be incorrectly entered or in debt
summary(custdata$age)
#Minimum and maximum seem to extreme to be feasible

cardata = read.table('cars1.csv', sep = ',', header = T)
cardata
names(cardata)
summary(cardata)
summary(cardata$speed)
#There doesn't seem to be anything amiss with this.
summary(cardata$dist)
#The wide range (2-120) is somewhat disconcerting, especially given how
#much greater 120 is relative to the third quartile, 56.

load('credit.rData')
names(d)
dim(d)
#This dataset is quite large, it has 1000 observations and 21 variables.
summary(d)
table(d$Personal.status.and.sex)
table(d$'Other.debtors/guarantors')

library(ggplot2)
install.packages("hexbin")
library(hexbin)
load('exampledata.rData')
custdata2 <- subset(custdata,
                    (custdata$age > 0 & custdata$age < 100
                     & custdata$income > 0))
summary(custdata2)
ggplot(custdata2, aes(x=age, y=income)) + geom_hex(binwidth=c(10,30000))

ggplot(custdata2, aes(x=age,y=income)) +
  geom_point(aes(colour = marital.stat )) +
  ylim(0,200000) +
  theme_bw() +
  ggtitle("Scatterplot of Income vs Age")
#The hexbin plot shows the reasonability of the apparent decrease in income with age

ggplot(custdata2, aes(x=income,y=num.vehicles)) +
  geom_point(aes(colour = marital.stat )) +
  ylim(0,10) +
  theme_bw() +
  ggtitle("Scatterplot of Income vs Number of Vehicles")

ggplot(custdata2, aes(x=income, y=num.vehicles)) + geom_hex(binwidth=c(30000,1)) +
  ggtitle("Hexbin Plot of Income vs. Number of Vehicles")
#Because number of car is a discrete variable, the hexbin plot proves to be
#more useful than the scatterplot for analyzing trends in the data

ggplot(custdata2) + geom_bar(aes(x=income.lt.30K, fill=recent.move)) +
  ggtitle("Segmented Bar Graph of Income less than 30K and Recent move")
#The segmented bar graph proves useful in analyzing relationships between two
#categorical variables.

