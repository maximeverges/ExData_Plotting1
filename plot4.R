setwd("C:/Users/maxim/Desktop/exdata_data_household_power_consumption")

data_1 <-read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?")
data_2 <- subset(data_1, Date %in% c("1/2/2007","2/2/2007"))
data_2$Date <- as.Date(data_2$Date, format = "%d/%m/%y")
datetime <- paste(as.Date(data_2$Date),data_2$Time)
data_2$Datetime <- as.POSIXct(datetime)


par(mfrow=c(2,2), mar=c(4,4,2,1), oma = c(0,0,2,0))
with(data_2, {
  plot(Global_active_power~Datetime, type = "l", ylab = "Global Active Power", xlab = "")
  plot(Voltage~Datetime, type = "l", ylab = "Voltage ", xlab = "datetime")
  plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})


dev.copy(png, file ="plot4.png", width = 480, height = 480)
dev.off()