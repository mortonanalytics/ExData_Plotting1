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
png(file = "plot3.png")
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
dev.off()