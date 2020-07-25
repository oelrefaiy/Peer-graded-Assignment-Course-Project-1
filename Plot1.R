#load some package for help :
library(data.table)
library(ggplot2)
library(dplyr)
#load dataset and assign it to Plot1Data Variable:
Plot1Data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Subset Plot1Data for 2 days required and assing it to subdata variable :
subdata<-Plot1Data[Plot1Data$Date %in% c('1/2/2007','2/2/2007'),]
#then we need to convert Global_active_power as Numeric datatype for ploting
Global_active_power<-as.numeric(subdata$Global_active_power)
#make a PNG file name "plot1.Png" and select widths and Height :
png("plot1.png",width = 480, height = 480)
#now we going to plot Histogram for Global_active_power Variable 
hist(Global_active_power,col = "red", main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
