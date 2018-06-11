filedata <- "./household_power_consumption.txt"
data2 <- read.table(filedata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData2 <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
timedate <- strptime(paste(subData2$Date, subData2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_Active_Power <- as.numeric(subData2$Global_active_power)
png("plot2.png", width=480, height=480)
plot(timedate, global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
