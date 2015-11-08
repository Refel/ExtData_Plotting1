#Read data file
elecdata<-read.csv("household_power_consumption.txt",sep=";")

#change to data type elecdata$Date
elecdata$Date<-as.Date(elecdata$Date,"%d/%m/%Y")

#filter elecdata from 2007.02.01 to 2007.02.02
elecdata<-subset(elecdata, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))

#converting the data to be ploted to integer
elecdata$Global_active_power<-(as.numeric(as.character(elecdata$Global_active_power)))


#openning file to save graph and generating the Plot1.png
png("Plot1.png")
hist(elecdata$Global_active_power,,main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.off() 
