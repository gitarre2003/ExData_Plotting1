## Read Raw Data ==========================
swName = 'household_power_consumption.txt'
data_in <- read.table(swName, header=TRUE, sep=";",
                   stringsAsFactors=FALSE, dec=".")

# select data of 2 days
start_date = '1/2/2007'
end_date = '2/2/2007'
data_in <- data_in[data_in$Date %in% c(start_date,end_date),]

## Plot =============================================
data_out1 <- strptime(paste(data_in$Date, data_in$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S") 
data_out2 <- as.numeric(data_in$Global_active_power)

png("plot2.png", width=480, height=480)
plot(data_out1, data_out2, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

