data<-read.delim("./data/household_power_consumption.txt", sep = ";")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-subset(data, Date==as.Date("2007-02-01") | Date ==as.Date("2007-02-02"))
time<-paste(data$Date,data$Time)
time<-strptime(time, "%Y-%m-%d %H:%M:%S")
data$Time<-time
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
par(mfrow=c(1,1))
plot(data$Time,data$Sub_metering_1, type = "l", col="black", xlab="" ,ylab = "Energy sub metering")
lines(data$Time,data$Sub_metering_2, col="red")
lines(data$Time,data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
