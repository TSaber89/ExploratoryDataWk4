## Exploratory Data Analysis Week 4 Question 5
## How many emissions from motor vehicle sources changed from 199 - 2008? 

## myNEI = SummarySCC_PM25   This file contains a data frame
## with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. 
## For each year, the table contains number of tons of PM2.5 emitted 
## from a specific type of source for the entire year.
#
## mySCC = Source_Classification_Code.rds  This table provides a mapping from the SCC digit strings in the 
## Emissions table to the actual name of the PM2.5 source.


myNEI <- readRDS("summarySCC_PM25.rds")
mySCC <- readRDS("Source_Classification_Code.rds")

##Find Baltimore motor vehicles

myBaltimoreMV <- subset(myNEI,myNEI$fips=="24510"  & myNEI$type=="ON-ROAD")
myBaltimoreMVyear <- aggregate(myBaltimoreMV$Emissions,by=list(myBaltimoreMV$year),FUN=sum)
colnames(myBaltimoreMVyear) <- c("year","Emissions")


##Create the plot
png(filename = "./plot5.png")
plot(myBaltimoreMVyear,myBaltimoreMVyear,type="o",
     xlab= "Year", ylab="Total Emissions (Tons)",
     main = "Total Emissions of PM2.5 related to motor vehicles", sub="Baltimore City")

dev.off()







                       













