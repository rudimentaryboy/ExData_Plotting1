mydata<-read.csv("household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")


mdata<-mydata[mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007",]


mdata$dateTime<-paste(mdata$Date, mdata$Time)

mdata$dateTime<-strptime(mdata$dateTime, "%d/%m/%Y %H:%M:%S")

plot(x=mdata$dateTime,y=mdata[,3],type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,file="plot2.png",height = 480, width = 480)

dev.off()