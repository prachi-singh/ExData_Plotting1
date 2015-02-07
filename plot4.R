## Plot4.R
## Prachi Singh


library(sqldf)

#Read relevant data, only dates Feb 1st and 2nd of 2007
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
  sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
  
#Convert date and time
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#Create a datetime vector to plot data against
dateTime  <- as.POSIXlt(paste(as.Date(data2$Date,format="%d/%m/%Y"), data2$Time, sep=" "))

# Plot 4: Multiple plots

par(mfrow=c(2,2))

# 1,1: Plot global active power usage

plot(dateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# 1,2: Plot Voltage

plot(dateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# 2,1: Plot sub_metering data

plot(dateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, data$Sub_metering_2, type="l", col="red")
lines(dateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n", cex=0.70)

# 2,2: Plot global reactive power usage

plot(dateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

# Copy graph from screen device to PNG file

dev.copy(png, file="plot4.png", width=480, height=480, units="px")
dev.off()