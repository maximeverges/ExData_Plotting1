setwd("C:/Users/maxim/Desktop/exdata_data_household_power_consumption")

data_1 <-read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?")
data_2 <- subset(data_1, Date %in% c("1/2/2007","2/2/2007"))
data_2$Date <- as.Date(data_2$Date, format = "%d/%m/%y")
datetime <- paste(as.Date(data_2$Date),data_2$Time)
data_2$Datetime <- as.POSIXct(datetime)

with(data_2, {
    plot(Global_active_power~Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
})

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()