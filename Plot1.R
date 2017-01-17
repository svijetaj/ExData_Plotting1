setwd("C://coursera/datascience/global_active_power")

#read file #
hhpc_file <- "household_power_consumption.txt"

#read data into variable
hhpc <- read.table(hhpc_file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")


#subset data for the range
sub_hhpc <- hhpc[hhpc$Date %in% c("1/2/2007","2/2/2007"),]

#histogram for global active power

#convert the global active power to numeric data

global_active_power <- as.numeric(sub_hhpc$Global_active_power)

#create a png file 
png("plot1.png")

#create an histogram into the png file

hist(global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power(kilowatts)")

#turn off the deive graphic

dev.off()
