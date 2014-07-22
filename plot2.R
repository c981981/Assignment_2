
setwd("C:/Users/chiemi yokota/Desktop/Exploratory Data Analysis/Project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

BAL <- subset(NEI, fips =='24510')
str(BAL)

png(filename = "plot2.png")


barplot(tapply(X = BAL$Emissions, INDEX = BAL$year, FUN = sum), 
          main = 'Total Emission in Baltimore City, MD', 
          xlab='Year', ylab =expression('PM'[2.5]), col = "green")

dev.off()

