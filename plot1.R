## JHU Data Science Course: Exploratory Data Analysis: Assignment 1:
## Plot One

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "datafile.zip", method="wget")

unzip("datafile.zip")

alldata <- read.table("household_power_consumption.txt",na.strings = "?", sep=";", header=TRUE)

alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")
				
library(chron)
alldata$Time <- chron(times=alldata$Time)

subdata1 <- subset(alldata, alldata$Date=="2007-2-1")
subdata2 <- subset(alldata, alldata$Date=="2007-2-2")

data <- rbind(subdata1, subdata2)

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

