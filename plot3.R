temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip",temp,method="curl")
data <- read.csv(unz(temp, "household_power_consumption.txt"),sep=";",na.strings="?")
unlink(temp)

data$Date<-strptime(paste(data$Date,as.character(data$Time)),"%d/%m/%Y %H:%M:%S")

mydata<-data[data$Date>"2007-02-01 00:00" & data$Date <"2007-02-02 24:00",]

Sys.setlocale("LC_TIME", "C")
plot(mydata$Date,mydata$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(mydata$Date,mydata$Sub_metering_2,type="l",xlab="",ylab="",col="red")
lines(mydata$Date,mydata$Sub_metering_3,type="l",xlab="",ylab="",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()

