temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip",temp,method="curl")
data <- read.csv(unz(temp, "household_power_consumption.txt"),sep=";",na.strings="?")
unlink(temp)

data$Date<-strptime(paste(data$Date,as.character(data$Time)),"%d/%m/%Y %H:%M:%S")

mydata<-data[data$Date>"2007-02-01 00:00" & data$Date <"2007-02-02 24:00",]
hist(mydata$Global_active_power, main="Global Active Power", xlab="Global Active Power",col="red")
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
