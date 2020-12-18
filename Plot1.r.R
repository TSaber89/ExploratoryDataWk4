## Exploratory Data Analysis Week 4 Question 1
## Have total emissions from PM2.5 decreased in the USfrom 1999 to 2008?

## myNEI = SummarySCC_PM25   This file contains a data frame
## with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. 
## For each year, the table contains number of tons of PM2.5 emitted 
## from a specific type of source for the entire year.
#
## mySCC = Source_Classification_Code.rds  This table provides a mapping from the SCC digit strings in the 
## Emissions table to the actual name of the PM2.5 source.


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mySumEmissionsYear <-with (myNEI,tapply(Emissions,year,sum))

# Create file and plot
png("./plot1.png",width=480,height=480)

plot(mySumEmissionsYear,type="o",pch=20,xaxt = "n", xlab="Year",ylab="Total PM2.5 Emission")
 title(main="Total PM2.5")
 axis(1,at1:4,lab=names(mySumEmissionsYear))

 #close plot device
dev.off()








##  Notes
## NEI <- readRDS("summarySCC_PM25.rds")
## SCC <- readRDS("Source_Classification_Code.rds")
