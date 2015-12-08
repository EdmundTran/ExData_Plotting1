# Read in data and convert date and time
powercons <- read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, nrows = 100000)
powercons$Date <- as.Date(powercons$Date, format = "%d/%m/%Y")
powercons$Time <- strptime(paste(powercons$Date, powercons$Time), format = "%Y-%m-%d %H:%M:%S")
twoday <- powercons[powercons$Date == as.Date("2007-02-01") | powercons$Date == as.Date("2007-02-02"),]

# Open PNG device and create file
png(file = "plot3.png")


# Graph energy sub-metering
plot(twoday$Time, twoday$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(twoday$Time, twoday$Sub_metering_2, col = "red")
lines(twoday$Time, twoday$Sub_metering_3, col = "blue")
legend("topright", legend = names(twoday)[7:9], lty = 1, col = 1:3)

# Close the PNG file device
dev.off()
