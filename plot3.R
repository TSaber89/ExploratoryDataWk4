## Exploratory Data Analysis Week 4 Question 3
## Of the four types of sources indicated by the
## type(point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions
## from 1999-2008 fir Baltimore city?  Which have seen 
## increases in emissions from 1999-2008?

## myNEI = SummarySCC_PM25   This file contains a data frame
## with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. 
## For each year, the table contains number of tons of PM2.5 emitted 
## from a specific type of source for the entire year.
#
## mySCC = Source_Classification_Code.rds  This table provides a mapping from the SCC digit strings in the 
## Emissions table to the actual name of the PM2.5 source.


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Subset data to just Baltimore City using specific fips codes.  Aggregate the emissions for each year by type.

myBaltimore <- subset(myNEI,myNEI$fips =="24510")
myBaltimoresumYear <- aggregate(myBaltimore$Emissions, by=list(myBaltimore$type,myBaltimore$year),FUN=sum)
colnames(myBaltimoresumYear) <- c("Type","Year","Emissions")

## Use ggplot2 for plot
library (ggplot2)
png(filename = "./plot3.png")
qplot(Year, Emissions, data=myBaltimoresumYear,color = Type, geom="line") +
ggtitle("Total Emissions of PM2.5 in Baltimore City by type") +
ylab("Total Emissions (Tons)") +
xlab("year")

dev.off()










