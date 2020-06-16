power<- data.table::fread(input = "household_power_consumption.txt",na.strings="?")
power$Date<-as.Date(power$Date,"%d/%m/%Y")
power3<- power[(power$Date>= "2007-02-01") & (power$Date<= "2007-02-02")]
power3$DateTime<-paste(power3$Date,power3$Time)
power3$DateTime<-as.POSIXct(power3$DateTime,"%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(power3[, DateTime], power3[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power3[, DateTime], power3[, Sub_metering_2],col="red")
lines(power3[, DateTime], power3[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()