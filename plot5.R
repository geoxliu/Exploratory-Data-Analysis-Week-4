# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(dplyr)
library(ggplot2)

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter and summarize data
ems_vehical_bal <- NEI %>%
                   filter(type == "ON-ROAD" & fips == "24510") %>%
                   group_by(year) %>%
                   summarize(total_ems = sum(Emissions))

# plot data
g <- ggplot(ems_vehical_bal, aes(x = year, y = total_ems))
g + geom_line(stat="identity", color = city) + labs(x="Year", y="Total PM2.5 Emissions (tons)") + ggtitle("PM2.5 Emissions from Vehicals in Baltimore")

# save figure
dev.copy(png,'plot5.png')
dev.off()
