# Class: Exploratory Data Analysis
# Class Project #1
# Due Oct 11

# Change to working directory
setwd("C://Users//Dan_Wolf//Documents//DataScience//JHU4_ExData//CP01")
# Check that we are in right place!
getwd()

# Read in raw data
powerData<-read.csv("household_power_consumption.csv",na.strings="?",sep=";",header=TRUE)

# Check top rows
head(powerData)

# Convert date to standart date format, do not overwrite original date - may need it later, but create new column of DateFmt data
powerData[,"DateFmt"]<-as.Date(as.POSIXct(powerData[,1],format = "%d/%m/%Y")) 

# Subsegment down to two days of interest
powerDataSubSample<-powerData[powerData$DateFmt=="2007-02-01" | powerData$DateFmt=="2007-02-02",]

# Combine Date factor and Time factor columns and convert to Date/time field add to the data frame - do not overwrite original fields
powerDataSubSample$DateTime<-strptime(x = as.character.Date(paste(powerDataSubSample$Date,powerDataSubSample$Time,sep=" ")), format = "%d/%m/%Y %H:%M:%S")



#Plot 3: Sub Metering plots (3) screen version
plot(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_1, col="black",type="l", xlab="", ylab="Energy sub metering")
lines(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_2,col="red",type="l")
lines(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_3,col="blue",type="l")
legend("topright",legend=c('Sub_metering_1','Sub_metering_1','Sub_metering_3'), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c('black','red','blue')) 

#Plot 3: Sub Metering plots (3) PNG versions
png(file = "plot3.png", bg = "white")
  plot(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_1, col="black",type="l", xlab="", ylab="Energy sub metering")
  lines(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_2,col="red",type="l")
  lines(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_3,col="blue",type="l")
  legend("topright",legend=c('Sub_metering_1','Sub_metering_1','Sub_metering_3'), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c('black','red','blue')) 
dev.off()




