# Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system to make a plot answer this question.

library(dplyr)
library(ggplot2)

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter and summarize data
ems_bal <- NEI %>%
           filter(fips == "24510") %>%
           group_by(type, year) %>%
           summarize(total_ems = sum(Emissions))

# plot data
g <- ggplot(ems_bal, aes(x = year, y = total_ems))
g + geom_line(stat="identity") + facet_grid(. ~ type) + labs(x="Year", y="Total PM2.5 Emissions (tons)") + ggtitle("PM2.5 Emissions by Type in Baltimore")

# save figure
dev.copy(png,'plot3.png')
dev.off()