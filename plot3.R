initaldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                       na.strings = "?", stringsAsFactors=FALSE, nrows=1)
columnnames<-colnames(initaldata)

mydata<-read.table("household_power_consumption.txt", sep=";", na.strings = "?",
                   stringsAsFactors=FALSE, skip =66637, nrows=2880)
colnames(mydata)<-columnnames
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")
mydata$Time<-paste(mydata$Date, mydata$Time)
mydata$Time<-strptime(mydata$Time, "%Y-%m-%d %H:%M:%S")

png(filename="plot3.png")
plot(mydata$Time, mydata$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(mydata$Time, mydata$Sub_metering_1, type="l")
points(mydata$Time, mydata$Sub_metering_2, type="l", col="red")
points(mydata$Time, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
