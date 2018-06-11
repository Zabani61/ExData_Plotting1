filedata <- "./household_power_consumption.txt"
data4 <- read.table(filedata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData4 <- data4[data4$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
timedate <- strptime(paste(subData4$Date, subData4$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_Active_Power <- as.numeric(subData4$Global_active_power)
global_Reactive_Power <- as.numeric(subData4$Global_reactive_power)
volt <- as.numeric(subData4$Voltage)
subMeter1 <- as.numeric(subData4$Sub_metering_1)
subMeter2 <- as.numeric(subData4$Sub_metering_2)
subMeter3 <- as.numeric(subData4$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(timedate, global_Active_Power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(timedate, volt, type="l", xlab="datetime", ylab="Voltage")

plot(timedate, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(timedate, subMeter2, type="l", col="red")
lines(timedate, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(timedate, global_Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
