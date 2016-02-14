## Getting the data
dataset_url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(dataset_url, "household_power_consumption.zip")
unzip("household_power_consumption.zip", exdir = "Exploratory Research")

## Setting Variables
datasfile <- "household_power_consumption.txt"
read_data <- read.table(datasfile, sep = ";", header = T, na.strings = "?", stringsAsFactors = F)

## providing a summary of data
str(read_data)

## Selecting only needed Timeframe
Clean_data <- read_data[read_data$Date %in% c("1/2/2007", "2/2/2007"),]

## Adjust Data table and Time
Settingtime <- strptime(paste(Clean_data$Date, Clean_data$Time), "%d/%m/%Y %H:%M:%S")
Clean_data <- cbind(Settingtime, Clean_data)

## Checking the margins if answers are 5.1 4.1 4.1 2.1 use next line to change 1's 
par("mar")

## changings margsing to the 1's
par(mar=c(1,1,1,1))

## Plot 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow = c(2, 2)) 
plot(Clean_data$Settingtime, Clean_data$Global_active_power, type = "l", xlab="", ylab = "Global Active Power")
plot(Clean_data$Settingtime, Clean_data$Voltage, type="l", xlab ="datetime", ylab ="Voltage")
plot(Clean_data$Settingtime, Clean_data$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
lines(Clean_data$Settingtime, Clean_data$Sub_metering_2, type = "l", col = "red")
lines(Clean_data$Settingtime, Clean_data$Sub_metering_3, type="l", col = "blue")
legend("topright", bty = "n", legend = labels, lty=1, col=columnlines)
plot(Clean_data$Settingtime, Clean_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

