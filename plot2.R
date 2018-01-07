rm(list=ls())
library("lubridate")

header<-read.table("household_power_consumption.txt", header = FALSE, sep = ";", 
                   na.strings = "?", stringsAsFactors = FALSE,nrows = 1)
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                 na.strings = "?", stringsAsFactors = FALSE, skip = 50000, nrows= 50000,col.names = header)

data$Date<-strptime(data$Date, "%d/%m/%Y")

data_in<-subset(data, Date=="2007-02-01"|Date=="2007-02-02")
data_in$Time<-parse_date_time(data_in$Time, orders = "HMS")
data_in$Date<-data_in$Date + hour(data_in$Time)*3600 + minute(data_in$Time)*60
with(data_in,plot(Date, Global_active_power, type = "l", 
                  ylab = "Global Active Power (kilowatts)", xlab = "" ))

dev.copy(png, file = "plot2.png" )
dev.off() 