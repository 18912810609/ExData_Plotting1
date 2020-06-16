power<- data.table::fread(input = "household_power_consumption.txt",na.strings="?")
power$Date<-as.Date(power$Date,"%d/%m/%Y")
power1<- power[(power$Date>= "2007-02-01") & (power$Date<= "2007-02-02")]
png("plot1.png", width=480, height=480)
hist(power1[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()