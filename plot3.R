## Read Raw Data ==========================
swName = 'household_power_consumption.txt'
data_in <- read.table(swName, header=TRUE, sep=";",
                   stringsAsFactors=FALSE, dec=".")

# select data of 2 days
start_date = '1/2/2007'
end_date = '2/2/2007'
data_in <- data_in[data_in$Date %in% c(start_date,end_date),]

## Plot =============================================
time_idx <- strptime(paste(data_in$Date, data_in$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S")

subMetering1 <- as.numeric(data_in$Sub_metering_1)
subMetering2 <- as.numeric(data_in$Sub_metering_2)
subMetering3 <- as.numeric(data_in$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(time_idx, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(time_idx, subMetering2, type="l", col="red")
lines(time_idx, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()