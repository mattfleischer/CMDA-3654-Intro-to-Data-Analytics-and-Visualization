setwd("C:/Users/Matthew/Documents/CMDA 3654 - Intro to Data Analytics and Visualization/R/Datasets")
carsdata = read.table('cars1.csv', sep = ',', header = T)
carsdata
#carsdata is 50 rows and 2 columns
var1 = carsdata[2,3]
var1
#Speed and Distance
carsdata[,1]
carsdata[,2]
SPEED = carsdata[,1]
SPEED
carsdata[15,]
