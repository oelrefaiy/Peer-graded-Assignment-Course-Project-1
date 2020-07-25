#load some package for help :
library(data.table)
library(ggplot2)
library(dplyr)
#load dataset and assign it to Plot1Data Variable:
Plot4Data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Subset Plot1Data for 2 days required and assing it to subdata variable :
subdata4<-Plot3Data[Plot4Data$Date %in% c('1/2/2007','2/2/2007'),]

#convert the Date and Time variables to Date/Time classes using strptime() :
DateAndTime <- strptime(paste(subdata4$Date, subdata4$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#then we need to convert Global_active_power as Numeric datatype for ploting
Global_active_power<-as.numeric(subdata4$Global_active_power)
#also convert variables of Sub metering as Numeric datatype for ploting:
Sub_metering_1 <- as.numeric(subdata4$Sub_metering_1)
Sub_metering_2 <- as.numeric(subdata4$Sub_metering_2)
Sub_metering_3 <- as.numeric(subdata4$Sub_metering_3)
#convert Global_reactive_power into numeric:
Global_reactive_power<- as.numeric(subdata4$Global_reactive_power)
#conver Voltage into numeric : 
voltage <- as.numeric(subdata4$Voltage)
#make a PNG file name "plot4.Png" and select widths and Height :
png("plot4.png", width=480, height=480)
#plot 
par(mfrow = c(2, 2)) #2 row and 2 columns
plot(DateAndTime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2) #upper left plot
plot(DateAndTime, voltage, type="l", xlab="datetime", ylab="Voltage") #upper right plot
plot(DateAndTime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") #bottom left plot
lines(DateAndTime, Sub_metering_2, type="l", col="red")
lines(DateAndTime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(DateAndTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") #bottom right plot
dev.off()