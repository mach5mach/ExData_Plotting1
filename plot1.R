
## only need the Date and Global Active Power
data <- read.table("household_power_consumption.txt", colClasses = c("character", "NULL", "numeric", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL"), sep=";", header=TRUE, na.strings = c("?"))

## only get rows in this date range
sample <- data[as.Date("01/02/2007", format="%d/%m/%Y") <= as.Date(data$Date, format="%d/%m/%Y"),]
sample <- sample[(as.Date(sample$Date, format="%d/%m/%Y") <= as.Date("02/02/2007", format="%d/%m/%Y")),]

png("ExData_Plotting1/plot1.png", width=480, height=480)
hist(sample$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")
dev.off()