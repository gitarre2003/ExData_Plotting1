## Read Raw Data ==========================
swName = 'household_power_consumption.txt'
data_in <- read.table(swName, header=TRUE, sep=";",
                   stringsAsFactors=FALSE, dec=".")

# select data of 2 days
start_date = '1/2/2007'
end_date = '2/2/2007'
data_in <- data_in[data_in$Date %in% c(start_date,end_date),]

## Plot =============================================
data_out <- as.numeric(data_in$Global_active_power)
png("plot1.png", width=480, height=480)
hist(data_out, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()

