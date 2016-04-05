##Load "lattice" library 
library("lattice")

##read table into data object
df <- read.table("household_power_consumption.txt", 
                 sep = ";", 
                 header = TRUE, 
                 stringsAsFactors = FALSE)
df$datetime <- strptime(paste(df$Date, df$Time),format="%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

##Subset data to 2007-02-01 and 2007-02-02
df <- df[df$Date >= as.Date("2007-02-01") & 
              df$Date <= as.Date("2007-02-02")  , ]

##Create Plot to PNG file             
png(file = "plot4.png")
par(mfrow = c(2,2))
#create time series line chart for Global Active Power
plot(df$datetime, df$Global_active_power, 
     type = "n",
     xlab = " ",
     ylab = "Global Active Power (kilowatts)")
lines(df$datetime, df$Global_active_power)
#Create time series line chart for Voltage
plot(df$datetime, df$Voltage, 
     type = "n",
     xlab = " ",
     ylab = "Voltage")
lines(df$datetime, df$Voltage)
#Create time series line chart for Sub Metering
plot(df$datetime, df$Sub_metering_1, 
     type = "n",
     xlab = " ",
     ylab = "Energy sub metering")
lines(df$datetime, df$Sub_metering_1, col = "black")
lines(df$datetime, df$Sub_metering_2, col = "red") 
lines(df$datetime, df$Sub_metering_3, col = "blue")
legend('topright', 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)
#Create time series line chart for Global Reactive Power
plot(df$datetime, df$Global_reactive_power, 
     type = "n",
     xlab = "datetime",
     ylab = "Global_reactive_power")
lines(df$datetime, df$Global_reactive_power)
dev.off()