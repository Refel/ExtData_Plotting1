elecdata<-read.csv("household_power_consumption.txt",sep=";")

elecdata$Date<-as.Date(elecdata$Date,"%d/%m/%Y")


elecdata<-subset(elecdata, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
x<-strptime(paste(elecdata$Date,elecdata$Time),"%Y-%m-%d %H:%M:%S")

#elecdata$Global_active_power<-(as.numeric(as.character(elecdata$Global_active_power)))*1000
elecdata$Sub_metering_1<-(as.numeric(as.character(elecdata$Sub_metering_1)))
elecdata$Sub_metering_2<-(as.numeric(as.character(elecdata$Sub_metering_2)))
elecdata$Sub_metering_3<-(as.numeric(as.character(elecdata$Sub_metering_3)))



png("Plot3.png")
plot(x,elecdata$Sub_metering_1, ylab="Energy sub metering",xlab="Frequency",col="black",type="n")
lines(x,elecdata$Sub_metering_1,col="black")
lines(x,elecdata$Sub_metering_2,col="red")
lines(x,elecdata$Sub_metering_3,col="blue")
TextLegend <-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
ColorLegend <-c("black","red","blue")
legend("topright",legend=TextLegend,col=ColorLegend,lty=1)
dev.off() 
