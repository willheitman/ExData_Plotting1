powercons <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)
powercons$DateTime <- paste(powercons$Date,powercons$Time)
powercons$Date <- as.Date(powercons$Date, format = "%d/%m/%Y")
powercons$DateTime <- strptime(powercons$DateTime, format = "%d/%m/%Y %H:%M:%S")
powercons <- subset(powercons,powercons$Date >= "2007-02-01" & powercons$Date <= "2007-02-02")

png(file = "plot2.png")

with(powercons,plot(DateTime,Global_active_power,type = "n",ylab = "Global Active Power (kilowatts)"))
lines(powercons$DateTime,powercons$Global_active_power)

dev.off()