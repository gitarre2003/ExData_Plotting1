## Read Raw Data ==========================
swName = 'household_power_consumption.txt'
data_in <- read.table(swName, header=TRUE, sep=";",
                   stringsAsFactors=FALSE, dec=".")

# select data of 2 days
start_date = '1/2/2007'
end_date = '2/2/2007'
data_in = data_in[data_in$Date %in% c(start_date,end_date),]

## Plot =============================================
time_idx = strptime(paste(data_in$Date, data_in$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S")

globalActivePower = as.numeric(data_in$Global_active_power)
globalReactivePower = as.numeric(data_in$Global_reactive_power)
subMetering1 = as.numeric(data_in$Sub_metering_1)
subMetering2 = as.numeric(data_in$Sub_metering_2)
subMetering3 = as.numeric(data_in$Sub_metering_3)
voltage      = as.numeric(data_in$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# plot 1
plot(time_idx, globalActivePower, type="l", xlab="", 
     ylab="Global Active Power", cex=0.2)
# plot 2
plot(time_idx, voltage, type="l", xlab="datetime", ylab="Voltage")
# plot 3
plot(time_idx, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(time_idx, subMetering2, type="l", col="red")
lines(time_idx, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=2.5, col=c("black", "red", "blue"), bty="n")
# plot 4
plot(time_idx, globalReactivePower, type="l", xlab="datetime", 
     ylab="Global_reactive_power")
dev.off()