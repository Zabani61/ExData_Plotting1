filedata <- "./household_power_consumption.txt"
data3 <- read.table(filedata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData3 <- data3[data3$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
timedate <- strptime(paste(subData3$Date, subData3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_Active_Power <- as.numeric(subData3$Global_active_power)
subMeter1 <- as.numeric(subData3$Sub_metering_1)
subMeter2 <- as.numeric(subData3$Sub_metering_2)
subMeter3 <- as.numeric(subData3$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(timedate, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(timedate, subMeter2, type="l", col="red")
lines(timedate, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
