library(tidyverse)

data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
dataF <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data <- dataF %>% unite(Date, c("Date", "Time"))
data$Date <- dmy_hms(data$Date)

png(filename="Plot4.png")