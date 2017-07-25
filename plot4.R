setwd("C:/Users/Mar/Documents/formations/MOOCs/Coursera_DataScience/04_exploratory_data_analysis/w1_project/")
library(dplyr)

data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
str(data)
data$Date<-as.Date(as.character(data$Date), format="%d/%m/%Y")

date1<-as.Date("01/02/2007", format="%d/%m/%Y")
date2<-as.Date("02/02/2007", format="%d/%m/%Y")
data_sub<-subset(data, data$Date==date1 | data$Date==date2)

# Reclass to numeric
data_sub[3:9]<-lapply(data_sub[3:9], function(x) as.numeric(as.character(x)))

#date time
x<-paste(data_sub$Date, data_sub$Time)
x<-strptime(x, "%Y-%m-%d %H:%M:%S")
new<-cbind(x, data_sub)

#plots
par(mfrow=(c(2,2)))

plot(new$x, new$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(new$x, new$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(new$x, new$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(new$x, new$Sub_metering_2, type="l",  col="red")
lines(new$x, new$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), cex=0.5)

plot(new$x, new$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power (kilowatts)")

dev.copy(png, 'plot4.png')
dev.off()
