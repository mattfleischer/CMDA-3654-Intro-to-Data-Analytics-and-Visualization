setwd("C:\\Users\\Matthew\\Documents\\CMDA 3654 - Intro to Data Analytics and Visualization\\R\\Datasets")
load('phsample.rData')
#This is a census dataset, where each observation is an anonymous household.
#It provides demographic info such as age, employment class, education, and sex.

psub = subset(dpus,with(dpus, (PINCP>1000)&(ESR==1)&(PINCP<=25000)&
(WKHP>=40)&(AGEP>=20)&(AGEP<=50)&(PWGTP1>0)&(COW %in% (1:7))&(SCHL %in% (1:24))))
#This code creates a subset of the data that contains only workers descirbed as
#full-time, reporting at least 40 hours a week, within 20-50 years of age, and
#with an annual income between $1,000 and $25,000.

psub$SEX = as.factor(ifelse(psub$SEX==1, 'M','F'))
#This reencodes sex from 1/2 to M/F
psub$SEX = relevel(psub$SEX,'M')
#This makes the reference sex M, so F encodes a difference from M
cowmap <- c("employee of a private for-profit",
  "Private not-for-profit employee",
  "Local government employee",
  "State government employee",
  "Federal government employee",
  "Self-employed not incorporated",
  "Self-employed incorporated")
#This reencodes worker class into a readable and more useful format.
psub$COW = as.factor(cowmap[psub$COW])
psub$COW = relevel(psub$COW,cowmap[1])
schlmap = c(
  rep("no high school diploma",15),
  "Regular high school diploma",
  "GED or alternative credential",
  "some college credit, no degree",
  "some college credit, no degree",
  "Associate's degree",
  "Bachelor's degree",
  "Master's degree",
  "Professional degree",
  "Doctorate degree")
#This reencodes education into something useful.
psub$SCHL = as.factor(schlmap[psub$SCHL])
psub$SCHL = relevel(psub$SCHL, schlmap[1])
dtrain = subset(psub, ORIGRANDGROUP >= 500)
dtest = subset(psub, ORIGRANDGROUP < 500)
#Creates smaller subsets for modeling and testing

summary(dtrain$COW)
#Provides the number of observations that fall into each category
