
setwd("C:/Users/chiemi yokota/Desktop/Exploratory Data Analysis/Project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

BAL <- subset(NEI, fips =='24510')
str(BAL)
BAL$year <- factor(BAL$year, levels = c('1999', '2002', '2005', '2008'))
str(BAL)

install.packages("ggplot2")
library(ggplot2)

png(filename = "plot3.png", width=830, height=530, units='px')

ggplot(data = BAL, aes(x=year, y=log(Emissions))) + facet_grid(.~type) + guides(fill=F) + 
        geom_boxplot(aes(fill=type)) + stat_boxplot(geom = 'errorbar') + 
        ylab(expression(paste('Log', ' of PM'[2.5], 'Emissions'))) + xlab('Year') +
        ggtitle('Emissions per Type in Baltimore City, MD') + geom_jitter(alpha = 0.10)

dev.off()




