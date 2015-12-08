# Read in and subset data
powercons <- read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, nrows = 100000)
tail(powercons) #confirm that data for 2007-02-01 and 2007-02-02 was read in
powercons$Date <- as.Date(powercons$Date, format = "%d/%m/%Y")
twoday <- powercons[powercons$Date == as.Date("2007-02-01") | powercons$Date == as.Date("2007-02-02"),]

# Open PNG device and create file
png(file = "plot1.png")

# Plot global active power
hist(as.numeric(twoday$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close the PNG file device
dev.off()
