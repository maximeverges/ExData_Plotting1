setwd("C:/Users/maxim/Desktop/exdata_data_household_power_consumption")

data_1 <-read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?")
data_2 <- subset(data_1, Date %in% c("1/2/2007","2/2/2007"))
hist(data_2$Global_active_power, main = "Global active power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
png("plot1.png", width = 480, height = 480)
dev.off()
