#load some package for help :
library(data.table)
library(ggplot2)
library(dplyr)
#load dataset and assign it to Plot1Data Variable:
Plot2Data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Subset Plot1Data for 2 days required and assing it to subdata variable :
subdata2<-Plot2Data[Plot2Data$Date %in% c('1/2/2007','2/2/2007'),]

#convert the Date and Time variables to Date/Time classes using strptime() :
DateAndTime <- strptime(paste(subdata2$Date, subdata2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#then we need to convert Global_active_power as Numeric datatype for ploting
Global_active_power<-as.numeric(subdata2$Global_active_power)
#make a PNG file name "plot2.Png" and select widths and Height :
png("plot2.png",width = 480, height = 480)
#now we going to plot Histogram for Global_active_power Variable 
plot(DateAndTime,Global_active_power,type= "l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
