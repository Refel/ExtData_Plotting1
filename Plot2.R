elecdata<-read.csv("household_power_consumption.txt",sep=";")

elecdata$Date<-as.Date(elecdata$Date,"%d/%m/%Y")
aux<-elecdata
elecdata<-aux



elecdata<-subset(elecdata, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
x<-strptime(paste(elecdata$Date,elecdata$Time),"%Y-%m-%d %H:%M:%S")
elecdata$Global_active_power<-(as.numeric(as.character(elecdata$Global_active_power)))
elecdata$Time<-(strptime(elecdata$Time,"%H:%M:%S"))




png("Plot2.png")
plot(x,elecdata$Global_active_power, ylab="Global Active Power (kilowatts)",xlab="Frequency",col="black",type="n")
lines(x,elecdata$Global_active_power)
dev.off() 
