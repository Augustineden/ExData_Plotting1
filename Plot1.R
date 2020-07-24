library(dplyr)
library(lubridate)

data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
data$Date <- dmy(data$Date)
data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
data$Time <- hms(data$Time)
data <- data %>% mutate_if(is.character, ~as.numeric(.))


png(filename="Plot1.png")
hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()