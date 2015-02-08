mydata<-read.csv("household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")


mdata<-mydata[mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007",]


mdata$dateTime<-paste(mdata$Date, mdata$Time)

mdata$dateTime<-strptime(mdata$dateTime, "%d/%m/%Y %H:%M:%S")

plot(x=mdata$dateTime,y=mdata[,7],type="l",ylab="Energy Sub Metering",xlab="")

points(x=mdata$dateTime,y=mdata[,8],type="l",col="red")

points(x=mdata$dateTime,y=mdata[,9],type="l",col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1), col=c("black","red","blue"))

dev.copy(png,file="plot3.png",height = 480, width = 480)

dev.off()