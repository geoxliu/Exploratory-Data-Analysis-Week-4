# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

library(dplyr)

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter and summarize data
yearly_ems_bal <- NEI %>%
                  filter(fips == "24510") %>%
                  group_by(year) %>%
                  summarize(total_ems = sum(Emissions))

# plot data
with(yearly_ems_bal, plot(year, total_ems,
                          type = "l",
                          main = "Total PM2.5 Emissions in Baltimore",
                          xlab = "Year",
                          ylab = "Total PM2.5 Emissions (tons)"))

# save figure
dev.copy(png,'plot2.png')
dev.off()