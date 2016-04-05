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
png(file = "plot1.png")
hist(as.numeric(df$Global_active_power),
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts",
     col = "red"
     )
dev.off()