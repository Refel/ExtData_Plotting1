#Read data file
elecdata<-read.csv("household_power_consumption.txt",sep=";")

#change to data type elecdata$Date
elecdata$Date<-as.Date(elecdata$Date,"%d/%m/%Y")

#filter elecdata from 2007.02.01 to 2007.02.02
elecdata<-subset(elecdata, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))

#setting x data conisdering date and time
x<-strptime(paste(elecdata$Date,elecdata$Time),"%Y-%m-%d %H:%M:%S")

#elecdata$Global_active_power<-(as.numeric(as.character(elecdata$Global_active_power)))*1000
elecdata$Sub_metering_1<-(as.numeric(as.character(elecdata$Sub_metering_1)))
elecdata$Sub_metering_2<-(as.numeric(as.character(elecdata$Sub_metering_2)))
elecdata$Sub_metering_3<-(as.numeric(as.character(elecdata$Sub_metering_3)))


#openning file to save graph and generating the Plot3.png
png("Plot3.png")
plot(x,elecdata$Sub_metering_1, ylab="Energy sub metering",xlab="",col="black",type="n")
lines(x,elecdata$Sub_metering_1,col="black")
lines(x,elecdata$Sub_metering_2,col="red")
lines(x,elecdata$Sub_metering_3,col="blue")
TextLegend <-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
ColorLegend <-c("black","red","blue")
legend("topright",legend=TextLegend,col=ColorLegend,lty=1)
dev.off() 
