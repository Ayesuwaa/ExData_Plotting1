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


##Plot 3
columncol <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(Clean_data$Settingtime, Clean_data$Sub_metering_1, type="l", col=columncol[1], xlab="", ylab="Energy sub metering")
lines(Clean_data$Settingtime, Clean_data$Sub_metering_2, col=columncol[2])
lines(Clean_data$Settingtime, Clean_data$Sub_metering_3, col=columncol[3])
legend("topright", legend=labels, col=columncol, lty="solid", cex = .7)

# checking margins 
par("mar")

## changings margsing to a num that will allowe better view of chart
par(oma=c(3,3,3,3))
par(mar=c(2, 4, 1, 1))

png(filename = "Plot3.png")
dev.off()
