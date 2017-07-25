setwd("C:/Users/Mar/Documents/formations/MOOCs/Coursera_DataScience/04_exploratory_data_analysis/w1_project/")
library(dplyr)

data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
str(data)
data$Date<-as.Date(as.character(data$Date), format="%d/%m/%Y")

date1<-as.Date("01/02/2007", format="%d/%m/%Y")
date2<-as.Date("02/02/2007", format="%d/%m/%Y")
data_sub<-subset(data, data$Date==date1 | data$Date==date2)

data_sub[3:4]<-lapply(data_sub[3:4], function(x) as.numeric(as.character(x)))

hist(data_sub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power")

dev.copy(png, 'plot1.png')
dev.off()