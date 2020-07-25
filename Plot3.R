#load some package for help :
library(data.table)
library(ggplot2)
library(dplyr)
#load dataset and assign it to Plot1Data Variable:
Plot3Data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Subset Plot1Data for 2 days required and assing it to subdata variable :
subdata3<-Plot3Data[Plot3Data$Date %in% c('1/2/2007','2/2/2007'),]

#convert the Date and Time variables to Date/Time classes using strptime() :
DateAndTime <- strptime(paste(subdata3$Date, subdata3$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#then we need to convert Global_active_power as Numeric datatype for ploting
Global_active_power<-as.numeric(subdata2$Global_active_power)
#also convert variables of Sub metering as Numeric datatype for ploting:
Sub_metering_1 <- as.numeric(subdata3$Sub_metering_1)
Sub_metering_2 <- as.numeric(subdata3$Sub_metering_2)
Sub_metering_3 <- as.numeric(subdata3$Sub_metering_3)
#make a PNG file name "plot3.Png" and select widths and Height :
png("plot3.png",width = 480, height = 480)
plot(DateAndTime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(DateAndTime, Sub_metering_2, type="l", col="red")
lines(DateAndTime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()