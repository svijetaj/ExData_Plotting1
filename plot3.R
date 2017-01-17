#read data into variable
hhpc <- read.table(hhpc_file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")


#subset data for the range
sub_hhpc <- hhpc[hhpc$Date %in% c("1/2/2007","2/2/2007"),]

#histogram for global active power

#convert the global active power to numeric data

global_active_power <- as.numeric(sub_hhpc$Global_active_power)

#merge date and time as single column

datetime <- strptime(paste(sub_hhpc$Date, sub_hhpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#submetering 1 2 3 make them as numeric columns

sm1 <- as.numeric(sub_hhpc$Sub_metering_1)
sm2 <- as.numeric(sub_hhpc$Sub_metering_2)
sm3 <- as.numeric(sub_hhpc$Sub_metering_3)

#plot into a png file
png("plot3.png")

#plot sub metering as base line
plot(datetime,sm1, type = "l", ylab = "Energy submetering", xlab = "")

#add submetering 2 as line to the plot
lines(datetime, sm2, type="l", col = "red")

#add submetering 3 as line to the plot
lines(datetime, sm3, type="l", col = "blue")

#add legend two show what is what
legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"), lty = 1, lwd = 2.5, col= c("black","red","blue"))

dev.off()
