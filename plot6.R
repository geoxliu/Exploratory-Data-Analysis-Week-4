# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?

library(dplyr)
library(ggplot2)

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter and summarize data
ems_vehical_balla <- NEI %>%
                   filter(fips %in% c("06037", "24510") & type == "ON-ROAD") %>%
                   group_by(year, fips) %>%
                   summarize(total_ems = sum(Emissions))
                   
# plot data
g <- ggplot(ems_vehical_balla, aes(x = year, y = total_ems, linetype = fips))
g + geom_line() + 
    scale_linetype_discrete(name = "Cities", labels = c("Los Angeles", "Baltimore")) +
    labs(x="Year", y="Total PM2.5 Emissions (tons)") + 
    ggtitle("PM2.5 Emissions from Vehicals in Baltimore and LA")

# save figure
dev.copy(png,'plot6.png')
dev.off()
