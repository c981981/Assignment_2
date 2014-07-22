
setwd("C:/Users/chiemi yokota/Desktop/Exploratory Data Analysis/Project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

SCC.C =SCC[grepl("coal", SCC$Short.Name, ignore.case=T),]

Data2 <- merge(x=NEI, y=SCC.C, by='SCC')
Data3 <- aggregate(Data2[,'Emissions'], by=list(Data2$year),sum)
Data3$EM <- round(Data3[,2]/1000,2)

png(filename="plot4.png")

barplot(Data3$EM, names.arg = Data3$Group.1, main = expression('Total Emissions of PM'[2.5]), 
        xlab = 'Year', ylab = expression(paste('PM', ''[2.5], 'in kilotons')),
        col = "orange")

dev.off()


