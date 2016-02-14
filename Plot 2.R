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

## Plot 2
plot(Clean_data$Settingtime, Clean_data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
