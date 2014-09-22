install.packages("XML")
library(XML)
url <- "http://www.repole.com/sun4cast/stats/cfb20130907.xml"
dataprob4 <- xmlToDataFrame(url)
summary(dataprob4)
#This dataset is awful and was chosen by a single team member without
#consulting the rest of us.  I highly doubt it will be used in the
#actual final project.