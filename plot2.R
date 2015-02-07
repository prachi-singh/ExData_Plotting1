## Plot2.R
## Prachi Singh


library(sqldf)

#Read relevant data, only dates Feb 1st and 2nd of 2007
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
  sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
  
#Convert date and time
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#Create a datetime vector to plot data against
dateTime  <- as.POSIXlt(paste(as.Date(data2$Date,format="%d/%m/%Y"), data2$Time, sep=" "))

# Plot 2: Global Active Power line graph over days

plot(dateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")

# Copy graph from screen device to PNG file

dev.copy(png, file="plot2.png", width=480, height=480, units="px")
dev.off()