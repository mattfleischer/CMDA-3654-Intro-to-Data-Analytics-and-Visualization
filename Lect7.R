#Lecture 7

getwd()
setwd("C:\\Users\\Matthew\\Documents\\CMDA 3654 - Intro to Data Analytics and Visualization\\R\\Datasets")


#The health insurance customer data
load('exampleData.rData')
#Examine data
names(custdata)
dim(custdata)
class(custdata)

#Summary statistics

summary(custdata) #for the entire data frame

#look at individual variables to spot problems

summary(custdata$is.employed)
summary(custdata$income)
summary(custdata$age)


