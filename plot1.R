
setwd("C:/Users/chiemi yokota/Desktop/Exploratory Data Analysis/Project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

EM <- aggregate(NEI[,'Emissions'], by=list(NEI$year),FUN = sum)
str(EM)

EM$EM <- round(EM[,2]/1000,2)

png(filename = 'plot1.png')

barplot(EM$EM, names.arg = EM$Group.1, main = expression('Total Emission of PM'[2.5]), 
            xlab = 'Year', ylab = expression(paste('PM', ''[2.5], 'in kilotons')),
              col = "blue")

dev.off()


                       

