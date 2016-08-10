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

#plotting using hist function
hist(Shpdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

#save the file to plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()