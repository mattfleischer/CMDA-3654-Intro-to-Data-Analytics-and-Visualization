getwd();
load("exampleData1.Rdata")

#Problem 1
incomecust = merge(medianincome, custdata)
summary(incomecust)
incomecust$norm.income = incomecust$Income / incomecust$Median.Income
summary(incomecust)
summary(incomecust$norm.income)

#This expression gives the ratio of the income of each observation by the
#Median income in its respective state.

#Problem 2
trainingSet = subset(custdata, custdata$gp <= 0.3)
testSet = subset(custdata, custdata$gp > 0.7)
