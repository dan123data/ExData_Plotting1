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


#plot 4: Four plots on one screen
par(mfcol=c(2,2),mar=c(4,4,2,1))

#plot 4a: same as plot 2
plot(powerDataSubSample$DateTime,powerDataSubSample$Global_active_power,typ='l', xlab="", ylab="Global Active Power (kilowatts)")

#plot 4b: same as plot 3
plot(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_1, col="black",type="l", xlab="", ylab="Energy sub metering")
lines(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_2,col="red",type="l")
lines(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_3,col="blue",type="l")
legend("topright",legend=c('Sub_metering_1','Sub_metering_1','Sub_metering_3'), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c('black','red','blue')) 

#plot 4c: Voltage 
plot(powerDataSubSample$DateTime,powerDataSubSample$Voltage,typ='l', xlab="datetime", ylab="Voltage")

#plot 4d: Reactive Power
plot(powerDataSubSample$DateTime,powerDataSubSample$Global_reactive_power,typ='l', xlab="datetime", ylab="Global_reactive_power")


# Plot 4: Same as above but PNG version: 

png(file = "plot4.png", bg = "white")

par(mfcol=c(2,2),mar=c(4,4,2,1))

#plot 4a: same as plot 2
plot(powerDataSubSample$DateTime,powerDataSubSample$Global_active_power,typ='l', xlab="", ylab="Global Active Power (kilowatts)")

#plot 4b: same as plot 3
plot(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_1, col="black",type="l", xlab="", ylab="Energy sub metering")
lines(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_2,col="red",type="l")
lines(powerDataSubSample$DateTime,powerDataSubSample$Sub_metering_3,col="blue",type="l")
legend("topright",legend=c('Sub_metering_1','Sub_metering_1','Sub_metering_3'), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c('black','red','blue')) 

#plot 4c: Voltage 
plot(powerDataSubSample$DateTime,powerDataSubSample$Voltage,typ='l', xlab="datetime", ylab="Voltage")

#plot 4d: Reactive Power
plot(powerDataSubSample$DateTime,powerDataSubSample$Global_reactive_power,typ='l', xlab="datetime", ylab="Global_reactive_power")

dev.off()


