#Set Working directory
setwd("~/DataAnalysisLearning/RLearning/ExploratoryDataAnalysis")


#Read file and save data to variable
hpdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#change date/time format
hpdata$Date <- as.Date(hpdata$Date, format="%d/%m/%Y")

#subset data to be plotted
Shpdata <- hpdata[(hpdata$Date=="2007-02-01") | (hpdata$Date=="2007-02-02"),]

#converting x data to numeric
Shpdata$Global_active_power <- as.numeric(as.character(Shpdata$Global_active_power))
Shpdata$Sub_metering_1 <- as.numeric(as.character(Shpdata$Sub_metering_1))
Shpdata$Sub_metering_2 <- as.numeric(as.character(Shpdata$Sub_metering_2))
Shpdata$Sub_metering_3 <- as.numeric(as.character(Shpdata$Sub_metering_3))

#converting time series
Shpdata <- transform(Shpdata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#####plotting

#set framework
par(mfrow=c(2,2))

#plot 1
plot(Shpdata$timestamp,Shpdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#plot 2
plot(Shpdata$timestamp,Shpdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

#plot 3
plot(Shpdata$timestamp,Shpdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Shpdata$timestamp,Shpdata$Sub_metering_2,col="red")
lines(Shpdata$timestamp,Shpdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", 
                                                  "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)

#plot 4
plot(Shpdata$timestamp,Shpdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#save the file to plot1.png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()