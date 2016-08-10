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

#plotting using plot function
plot(Shpdata$timestamp,Shpdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Shpdata$timestamp,Shpdata$Sub_metering_2,col="red")
lines(Shpdata$timestamp,Shpdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", 
                                                  "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

#save the file to plot1.png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()