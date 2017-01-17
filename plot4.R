#read data into variable
hhpc <- read.table(hhpc_file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")


#subset data for the range
sub_hhpc <- hhpc[hhpc$Date %in% c("1/2/2007","2/2/2007"),]

#histogram for global active power

#convert the global active power to numeric data

global_active_power <- as.numeric(sub_hhpc$Global_active_power)
grp <- as.numeric(sub_hhpc$Global_reactive_power)

#merge date and time as single column

datetime <- strptime(paste(sub_hhpc$Date, sub_hhpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#submetering 1 2 3 make them as numeric columns

sm1 <- as.numeric(sub_hhpc$Sub_metering_1)
sm2 <- as.numeric(sub_hhpc$Sub_metering_2)
sm3 <- as.numeric(sub_hhpc$Sub_metering_3)

#make voltage as numerice column

volt <- as.numeric(sub_hhpc$Voltage)

#plot a graph on to png file
png("plot4.png")

#make a plot of two rows and two columns fill row wise
par(mfrow=c(2,2))

#plot all the graphs one by one

plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)



plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")



plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, sm2, type="l", col="red")

lines(datetime, sm3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")



plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")



dev.off()
