library(tidyverse)

data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
dataF <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data <- dataF %>% unite(Date, c("Date", "Time"))
data$Date <- dmy_hms(data$Date)

png(filename="Plot2.png")
plot(data$Global_active_power ~ data$Date, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
