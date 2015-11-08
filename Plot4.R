#Read data file
elecdata<-read.csv("household_power_consumption.txt",sep=";")

#change to data type elecdata$Date
elecdata$Date<-as.Date(elecdata$Date,"%d/%m/%Y")

#filter elecdata from 2007.02.01 to 2007.02.02
elecdata<-subset(elecdata, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))

#setting x data conisdering date and time
x<-strptime(paste(elecdata$Date,elecdata$Time),"%Y-%m-%d %H:%M:%S")

#converting the data to be ploted to integer
elecdata$Global_active_power<-(as.numeric(as.character(elecdata$Global_active_power)))
elecdata$Global_reactive_power<-(as.numeric(as.character(elecdata$Global_reactive_power)))
elecdata$Sub_metering_1<-(as.numeric(as.character(elecdata$Sub_metering_1)))
elecdata$Sub_metering_2<-(as.numeric(as.character(elecdata$Sub_metering_2)))
elecdata$Sub_metering_3<-(as.numeric(as.character(elecdata$Sub_metering_3)))
elecdata$Voltage<-(as.numeric(as.character(elecdata$Voltage)))


#openning file to save graph and generating the 4 graphics requested
png("Plot4.png")
#windows()
par(mfrow=c(2,2))

#plot 1
plot(x,elecdata$Global_active_power, ylab="Global Active Power",xlab="",col="black",type="n")
lines(x,elecdata$Global_active_power)

#plot 2
plot(x,elecdata$Voltage, ylab="Voltage",xlab="datetime",col="black",type="n")
lines(x,elecdata$Voltage)

#plot 3
plot(x,elecdata$Sub_metering_1, ylab="Energy sub metering",xlab="",col="black",type="n")
lines(x,elecdata$Sub_metering_1,col="black")
lines(x,elecdata$Sub_metering_2,col="red")
lines(x,elecdata$Sub_metering_3,col="blue")
TextLegend <-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
ColorLegend <-c("black","red","blue")
legend("topright",legend=TextLegend,col=ColorLegend,border="blue",lty=1,bty="n")

#plot 4
plot(x,elecdata$Global_reactive_power, ylab="Global_reactive_power",xlab="datetime",col="black",type="n")
lines(x,elecdata$Global_reactive_power)


dev.off() 

