# Read in data and convert date and time
powercons <- read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, nrows = 100000)
powercons$Date <- as.Date(powercons$Date, format = "%d/%m/%Y")
powercons$Time <- strptime(paste(powercons$Date, powercons$Time), format = "%Y-%m-%d %H:%M:%S")
twoday <- powercons[powercons$Date == as.Date("2007-02-01") | powercons$Date == as.Date("2007-02-02"),]

# Open PNG device and create file
png(file = "plot2.png")

# Graph global active power
plot(twoday$Time, twoday$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close the PNG file device
dev.off()
