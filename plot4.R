# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(dplyr)
library(ggplot2)

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter and summarize data
coal_SCCs <- SCC %>%
             filter(grepl("coal", EI.Sector, ignore.case = TRUE)) %>%
             select(SCC)

yearly_ems_coal <- NEI %>%
                   filter(SCC %in% coal_SCCs$SCC) %>%
                   group_by(year) %>%
                   summarize(total_ems = sum(Emissions))

# plot data
g <- ggplot(yearly_ems_coal, aes(x = year, y = total_ems))
g + geom_line(stat="identity") + labs(x="Year", y="Total PM2.5 Emissions (tons)") + ggtitle("PM2.5 Emissions from Coal")

# save figure
dev.copy(png,'plot4.png')
dev.off()
