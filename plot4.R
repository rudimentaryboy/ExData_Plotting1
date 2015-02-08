mydata<-read.csv("household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")


mdata<-mydata[mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007",]


mdata$dateTime<-paste(mdata$Date, mdata$Time)

mdata$dateTime<-strptime(mdata$dateTime, "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2),mar=c(4,4,2,1))

plot(x=mdata$dateTime,y=mdata$Global_active_power,type="l", ylab="Global Active Power",xlab="")

plot(x=mdata$dateTime,y=mdata$Voltage,type="l", ylab="Voltage",xlab="datetime")

plot(x=mdata$dateTime,y=mdata[,7],type="l",ylab="Energy Sub Metering",xlab="")

points(x=mdata$dateTime,y=mdata[,8],type="l",col="red")

points(x=mdata$dateTime,y=mdata[,9],type="l",col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",cex=0.75,lty=c(1,1), col=c("black","red","blue"))

plot(x=mdata$dateTime,y=mdata[,4],type="l", ylab="Global Reactive Power",xlab="datetime")

dev.copy(png,file="plot4.png",height = 480, width = 480)

dev.off()