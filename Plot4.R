library(tidyverse)
library(lubridate)

data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
dataF <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data <- dataF %>% unite(Date, c("Date", "Time"))
data$Date <- dmy_hms(data$Date)

png(filename="Plot4.png")
par(mfrow = c(2, 2))
with(data,  {
        plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        plot(Date, Voltage, type="l", xlab="datetime", ylab="Voltage")
        plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(Date, Sub_metering_2, col = "red")
        lines(Date, Sub_metering_3, col = "blue")
        legend("topright", lty=1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Date, Global_reactive_power, type="l", xlab="datetime")
})
dev.off()