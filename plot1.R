mydata<-read.csv("household_power_consumption.txt", header=TRUE,sep=";")

mydata[,1]<-as.Date(mydata[,1],format="%d/%m/%Y")

mydata[,2]<-strptime(mydata[,2],format="%H:%M:%S")

mydata[,2]<-strftime(mydata[,2],"%H:%M:%S")

mdata<-mydata[mydata$Date=="2007-02-01"|mydata$Date=="2007-02-02",]

mdata[,3]<-as.numeric(as.character(mdata$Global_active_power))

hist(mdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png,file="plot1.png",height = 480, width = 480)

dev.off()