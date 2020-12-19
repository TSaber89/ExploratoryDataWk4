## Exploratory Data Analysis Week 4 Question 4
## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008? 

## myNEI = SummarySCC_PM25   This file contains a data frame
## with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. 
## For each year, the table contains number of tons of PM2.5 emitted 
## from a specific type of source for the entire year.
#
## mySCC = Source_Classification_Code.rds  This table provides a mapping from the SCC digit strings in the 
## Emissions table to the actual name of the PM2.5 source.


myNEI <- readRDS("summarySCC_PM25.rds")
mySCC <- readRDS("Source_Classification_Code.rds")


## Find all records that are coal related.
myCoalclass <- mySCC[grepl("Coal",mySCC$Short.Name),]
myCoalEmissions <-myNEI[myNEI$SCC %in% myCoalclass$SCC,]

myCoalEmissionsYear <- aggregate(myCoalEmissions$Emissions, by=list(myCoalEmissions$year),FUN=sum)
colnames(myCoalEmissionsYear) <- c("Year","Emissions")

##Create the plot
png(filename = "./plot4.png")
plot(myCoalEmissionsYear$Year,myCoalEmissionsYear$Emissions,type="o",
     xlab = "Year", ylab = "Total Emissions (Tons)",
     main = "Coal RElated Emissions of PM2.5 in US from 1999-2008")

dev.off()

                       













