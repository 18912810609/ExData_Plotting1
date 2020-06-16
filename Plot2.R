power<- data.table::fread(input = "household_power_consumption.txt",na.strings="?")
power$Date<-as.Date(power$Date,"%d/%m/%Y")
power2<- power[(power$Date>= "2007-02-01") & (power$Date<= "2007-02-02")]
power2$DateTime<-paste(power2$Date,power2$Time)
power2$DateTime<-as.POSIXct(power2$DateTime,"%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(x = power2[, DateTime], y = power2[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
