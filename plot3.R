## JHU Data Science Course: Exploratory Data Analysis: Assignment 1:
## Plot Three

#Download the data zip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "datafile.zip", method="wget")

# Unzip the file
unzip("datafile.zip")

#Read in all the data
alldata <- read.table("household_power_consumption.txt",na.strings = "?", sep=";", header=TRUE)

#Convert the class of the Date column to the date class
alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")

#Extract the rows for the 1st Feb 2007 and for the 2nd Feb 2007
subdata1 <- subset(alldata, alldata$Date=="2007-2-1")
subdata2 <- subset(alldata, alldata$Date=="2007-2-2")

#Concatenate the 2nd Feb data to the 1st Feb data to give the required data set
data <- rbind(subdata1, subdata2)

#Make date-time combined column and use lubridate to convert it to POSIXct-POSIXt format
data$datetime <- paste(data$Date, data$Time, sep=" ")

library(lubridate)
data$datetime <- ymd_hms(data$datetime)

#Set up PNG device to save the plot as a PNG file
png('plot3.png')

#Produce plot3 using points command to add the 2nd and 3rd sub metering data
plot(data$datetime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(data$datetime, data$Sub_metering_2, type="l", col="red", ylab="Energy sub metering", xlab="")
points(data$datetime, data$Sub_metering_3, type="l", col="blue", ylab="Energy sub metering", xlab="")

#Add the legend
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save the file
dev.off()
