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


#openning file to save graph and generating the Plot1.png
png("Plot2.png")
plot(x,elecdata$Global_active_power, ylab="Global Active Power (kilowatts)",xlab="Frequency",col="black",type="n")
lines(x,elecdata$Global_active_power)
dev.off() 
