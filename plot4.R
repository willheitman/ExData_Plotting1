powercons <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)
powercons$DateTime <- paste(powercons$Date,powercons$Time)
powercons$Date <- as.Date(powercons$Date, format = "%d/%m/%Y")
powercons$DateTime <- strptime(powercons$DateTime, format = "%d/%m/%Y %H:%M:%S")
powercons <- subset(powercons,powercons$Date >= "2007-02-01" & powercons$Date <= "2007-02-02")


png(file = "plot4.png")

par(mfrow = c(2,2))

with(powercons,plot(DateTime,Global_active_power,type = "n",ylab = "Global Active Power (kilowatts)"))
lines(powercons$DateTime,powercons$Global_active_power)

with(powercons,plot(DateTime,Voltage,type = "n",ylab = "Voltage", xlab = "datetime"))
lines(powercons$DateTime,powercons$Voltage)

with(powercons,plot(DateTime,Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab = ""))
lines(powercons$DateTime,powercons$Sub_metering_1,col = "black")
lines(powercons$DateTime,powercons$Sub_metering_2,col = "red")
lines(powercons$DateTime,powercons$Sub_metering_3,col = "blue")
legend("topright",col = c("black","red","blue"), cex = .65, bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 2)

with(powercons,plot(DateTime,Global_reactive_power,type = "n",ylab = "Global_reactive_power",xlab = "datetime"))
lines(powercons$DateTime,powercons$Global_reactive_power)

dev.off()