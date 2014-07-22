setwd("C:/Users/chiemi yokota/Desktop/Exploratory Data Analysis/Project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

BAL2 <- subset(NEI, fips=='24510' & type =='ON-ROAD')
CA2 <- subset(NEI, fips=='06037' & type =='ON-ROAD')

BAL3 <- aggregate(BAL2[,'Emissions'], by=list(BAL2$year), sum)
colnames(BAL3)<-c('year', 'Emissions')
BAL3$City <- paste(rep('MD', 4))

CA3 <- aggregate(CA2[,'Emissions'], by=list(CA2$year), sum)
colnames(CA3)<-c('year', 'Emissions')
CA3$City <- paste(rep('CA', 4))

BAL_CA <- as.data.frame(rbind(BAL3, CA3))

library(ggplot2)

png(filename = "plot6.png")

ggplot(data = BAL_CA, aes(x=year, y=Emissions, fill=year)) + geom_bar(stat="identity") + 
        guides(fill=F) + ggtitle('Total Emissions of Motor Vehicle Sources \
        Los Angeles Countgy, CA vs Baltimore City, MD') + ylab(expression('PM'[2.5])) + 
        xlab('Year') + facet_grid(.~City)

dev.off()





