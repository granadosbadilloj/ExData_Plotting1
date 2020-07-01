data<-read.delim("./data/household_power_consumption.txt", sep = ";")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-subset(data, Date==as.Date("2007-02-01") | Date ==as.Date("2007-02-02"))
time<-paste(data$Date,data$Time)
time<-strptime(time, "%Y-%m-%d %H:%M:%S")
data$Time<-time
data$Global_active_power<-as.numeric(data$Global_active_power)
par(mfrow=c(1,1))
hist(data$Global_active_power, col="red", main= "Global Active Power", xlab="Global Active Power (kilowatts)")