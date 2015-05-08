# PLOT 4

#Read and create dataset
df <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
df <- subset(df, (Date == "1/2/2007") | (Date == "2/2/2007"))


#Convert Date and Time variables
df$DateTime <- strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#Create plot 4
png("plot4.png", width = 480, height = 480, units = "px")

par (mfrow = c(2, 2), bg="transparent", lwd=0.5)

plot(df$DateTime, df$Global_active_power, type = "l", xlab="", 
     ylab= "Global Active Power")

plot(df$DateTime, df$Voltage, type= "l", xlab="datetime", ylab= "Voltage")

plot(df$DateTime, df$Sub_metering_1, type = "l", col = "black", xlab= "",
     ylab= "Energy sub metering", )
points(df$DateTime, df$Sub_metering_2, type = "l", col = "red")
points(df$DateTime, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), pch = "___", bty = "n")

plot(df$DateTime, df$Global_reactive_power, type = "l", xlab="datetime", 
     ylab= "Global_reactive_power")

dev.off()