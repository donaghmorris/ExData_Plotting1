## JHU Data Science Course: Exploratory Data Analysis: Assignment 1:
## Plot One

#Download the data zip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "datafile.zip", method="wget")

# Unzip the file
unzip("datafile.zip")

#Read in all the data
alldata <- read.table("household_power_consumption.txt",na.strings = "?", sep=";", header=TRUE)

#Convert the class of the Date column to the date class
alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")
				
#Convert the class of the Time column to the times class using the chron library
library(chron)
alldata$Time <- chron(times=alldata$Time)

#Extract the rows for the 1st Feb 2007 and for the 2nd Feb 2007
subdata1 <- subset(alldata, alldata$Date=="2007-2-1")
subdata2 <- subset(alldata, alldata$Date=="2007-2-2")

#Concatenate the 2nd Feb data to the 1st Feb data to give the required data set
data <- rbind(subdata1, subdata2)

#Produce the plot1 histogram setting the colour to be red and improving the x label and heading text
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
