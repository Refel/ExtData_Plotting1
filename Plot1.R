elecdata<-read.csv("household_power_consumption.txt",sep=";")

elecdata$Date<-as.Date(elecdata$Date,"%d/%m/%Y")

elecdata<-subset(elecdata, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
elecdata$Global_active_power<-(as.numeric(as.character(elecdata$Global_active_power)))

png("Plot1.png")
hist(elecdata$Global_active_power,,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.off() 
