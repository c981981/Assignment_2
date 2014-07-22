
setwd("C:/Users/chiemi yokota/Desktop/Exploratory Data Analysis/Project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

BAL2 <- subset(NEI, fips==24510 & type =='ON-ROAD')

str(BAL2)

BAL3 <- aggregate(BAL2[,'Emissions'], by=list(BAL2$year), sum)
colnames(BAL3)<-c('year', 'Emissions')

str(BAL3)

library(ggplot2)

png(filename = "plot5.png")

ggplot(data = BAL2, aes(x=year, y=Emissions, fill=year)) + geom_bar(stat="identity") + guides(fill=F)+ 
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none')

dev.off()



