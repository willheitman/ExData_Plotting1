powercons <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)
powercons$DateTime <- paste(powercons$Date,powercons$Time)
powercons$Date <- as.Date(powercons$Date, format = "%d/%m/%Y")
powercons$DateTime <- strptime(powercons$DateTime, format = "%d/%m/%Y %H:%M:%S")
powercons <- subset(powercons,powercons$Date >= "2007-02-01" & powercons$Date <= "2007-02-02")

png(file = "plot3.png")

with(powercons,plot(DateTime,Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab = ""))
lines(powercons$DateTime,powercons$Sub_metering_1,col = "black")
lines(powercons$DateTime,powercons$Sub_metering_2,col = "red")
lines(powercons$DateTime,powercons$Sub_metering_3,col = "blue")
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 2)

dev.off()