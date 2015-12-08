# Read in data and convert date and time
powercons <- read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, nrows = 100000)
powercons$Date <- as.Date(powercons$Date, format = "%d/%m/%Y")
powercons$Time <- strptime(paste(powercons$Date, powercons$Time), format = "%Y-%m-%d %H:%M:%S")
twoday <- powercons[powercons$Date == as.Date("2007-02-01") | powercons$Date == as.Date("2007-02-02"),]

# Open PNG device and create file
png(file = "plot4.png")

# Make four plots
par(mfrow = c(2, 2))
par(mar = c(4, 4, 1, 1))

plot(twoday$Time, twoday$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(twoday$Time, twoday$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(twoday$Time, twoday$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(twoday$Time, twoday$Sub_metering_2, col = "red")
lines(twoday$Time, twoday$Sub_metering_3, col = "blue")
legend("topright", legend = names(twoday)[7:9], lty = 1, col = 1:3, bty = "n")

plot(twoday$Time, twoday$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")

# Close the PNG file device
dev.off()
