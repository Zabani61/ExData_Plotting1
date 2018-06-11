filedata <- "./household_power_consumption.txt"
data1 <- read.table(filedata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData1 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
global_Active_Power <- as.numeric(subData1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_Active_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
