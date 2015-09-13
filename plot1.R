initaldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                       na.strings = "?", stringsAsFactors=FALSE, nrows=1)
columnnames<-colnames(initaldata)

mydata<-read.table("household_power_consumption.txt", sep=";", na.strings = "?",
                   stringsAsFactors=FALSE, skip =66637, nrows=2880)
colnames(mydata)<-columnnames
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")
mydata$Time<-paste(mydata$Date, mydata$Time)
mydata$Time<-strptime(mydata$Time, "%Y-%m-%d %H:%M:%S")

png(filename="plot1.png")
hist(mydata$Global_active_power, col="red", main="Global Active Power", 
     xla="Global Active Power (kilowatts)")
dev.off()
