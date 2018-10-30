
## only need the Date and Global Active Power
data <- read.table("household_power_consumption.txt", colClasses = c("character", "character", "NULL", "NULL", "NULL", "NULL", "numeric", "numeric", "numeric"), sep=";", header=TRUE, na.strings = c("?"))

## only get rows in this date range
sample <- data[as.Date("01/02/2007", format="%d/%m/%Y") <= as.Date(data$Date, format="%d/%m/%Y"),]
sample <- sample[(as.Date(sample$Date, format="%d/%m/%Y") <= as.Date("02/02/2007", format="%d/%m/%Y")),]

datetime <- strptime(paste(sample$Date, sample$Time), "%d/%m/%Y %H:%M:%S")

png("ExData_Plotting1/plot3.png", width=480, height=480)

##start the plot, add each submeter, add a legend
plot(datetime, as.numeric(sample$Sub_metering_1), type="n", xlab="", ylab="Energy sub metering")
points(datetime, sample$Sub_metering_1, type="l", col="black")
points(datetime, sample$Sub_metering_2, type="l", col="red")
points(datetime, sample$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.off()