library(lubridate)


# Load the source data
data <- read.csv("household_power_consumption.txt"
                ,sep = ";"
                ,col.names  = c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")
                ,na.strings = c("?")
                ,colClasses = c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Consolidate the date and time
data <- within(data, Datetime <- as.POSIXlt(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Subset the desired dates
data <- subset(data, Datetime >= "2007-02-01 00:00:00" & Datetime <= "2007-02-02 23:59:59")

# Setup the output
png("plot2.png", height=480, width=480)

# Render the chart
plot(data$Datetime, data$GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close the device
dev.off()
