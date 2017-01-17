#read data into variable
hhpc <- read.table(hhpc_file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")


#subset data for the range
sub_hhpc <- hhpc[hhpc$Date %in% c("1/2/2007","2/2/2007"),]

#histogram for global active power

#convert the global active power to numeric data

global_active_power <- as.numeric(sub_hhpc$Global_active_power)

#merge date and time as single column

datetime <- strptime(paste(sub_hhpc$Date, sub_hhpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

head(datetime)

#create a png file 
png("plot2.png")

#create an histogram into the png file
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#turn off the deive graphic

dev.off()

