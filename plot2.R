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

#plot
plot(new$x, new$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, 'plot2.png')
dev.off()
