## Exploratory Data Analysis Week 4 Question 6
## Compare emissions from motor vehicle sources in Baltimore City with emissions from 
##motor vehicle sources in LA County. Which city has seen greater changes over time
##in motor vehicle emissions?
##

## myNEI = SummarySCC_PM25   This file contains a data frame
## with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. 
## For each year, the table contains number of tons of PM2.5 emitted 
## from a specific type of source for the entire year.
#
## mySCC = Source_Classification_Code.rds  This table provides a mapping from 
##the SCC digit strings in the Emissions table to the actual name of the PM2.5 
##source.


myNEI <- readRDS("summarySCC_PM25.rds")
mySCC <- readRDS("Source_Classification_Code.rds")

##Find data relative to fips an on-road
myBalt2LA <- subset(myNEI,(myNEI$fips=="24510" | myNEI$fips=="06037") 
                    & myNEI$type=="ON-ROAD")
myBalt2LAbyYR <- aggregate(myBalt2LA$Emissions, 
                           by=list(myBalt2LA$fips,myBalt2LA$year),FUN=sum)

colnames(myBalt2LAbyYR) <- c("City","Year","Emissions")                       

##Plot
library(ggplot2)
png(filename = "./plot6.png")
qplot(Year,Emissions,data=myBalt2LAbyYR,color=City,geom="line")
   ggtitle("Emissions of PM2.5 in Baltimore City (24510) and LA County (06037)")
   ylab("Total Emissions from motot vehicles(Tons") 
   xlab("Year")

dev.off()










