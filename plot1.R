# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

library(dplyr)

# read data
NEI <- readRDS("summarySCC_PM25.rds")

# summarize data
yearly_ems <- NEI %>%
              group_by(year) %>%
              summarize(total_ems = sum(Emissions))

# plot data
with(yearly_ems, plot(year, total_ems,
                      type = "l", 
                      main = "Total PM2.5 Emissions from All Sources in the United States",
                      xlab = "Year",
                      ylab = "Total PM2.5 Emissions (tons)"))

# save figure
dev.copy(png,'plot1.png')
dev.off()
