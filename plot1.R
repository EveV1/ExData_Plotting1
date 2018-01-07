rm(list=ls())

header<-read.table("household_power_consumption.txt", header = FALSE, sep = ";", 
                   na.strings = "?", stringsAsFactors = FALSE,nrows = 1)
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                 na.strings = "?", stringsAsFactors = FALSE, skip = 50000, nrows= 50000,col.names = header)
data$Date<-strptime(data$Date, "%d/%m/%Y")

data_in<-subset(data, Date=="2007-02-01"|Date=="2007-02-02")
hist(data_in$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
title(main = "Global Active Power")
dev.copy(png, file = "plot1.png" )
dev.off() 
