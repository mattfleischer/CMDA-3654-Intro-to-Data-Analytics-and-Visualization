#Matt Fleischer
#CMDA 3654 - Intro to Data Analytics and Visualization
#Homework 1
#9/8/14

#Problem 1
setwd("C:\\Users\\Matthew\\Documents\\CMDA 3654 - Intro to Data Analytics and Visualization\\R\\Datasets")
pricesdata = read.table('prices.csv', sep = ',', header = T, col.names = c("Price", "SQFT", "Age", "NE"))
pricesdata
#row.names adds a vector of row names to the data set, replacing the default observation numbers
randomdata = read.table('1', sep = ' ', header = T, col.names = c("a", "b", "c"))
randomdata

#Problem 2
r1 = c(3, 4, 7, 4)
r2 = c(5, 6, 9, 8)
r3 = c(9, 12, 11, 12)
r4 = c(1, 0, 15, 2)
MAT1 = cbind(r1, r2, r3, r4)
MAT1
tail(MAT1, n = 1)
t(MAT1)
solve(MAT1)

#Problem 3
fpe = read.table("http://data.princeton.edu/wws509/datasets/effort.dat") 
fpe
write.table(fpe, col.names = F, row.names = F)
names(fpe)
rownames(fpe)
head(fpe)