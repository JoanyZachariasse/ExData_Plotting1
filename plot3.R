# PLOT 3

#Read and create dataset
df <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
df <- subset(df, (Date == "1/2/2007") | (Date == "2/2/2007"))


#Convert Date and Time variables
df$DateTime <- strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#Create plot 3
png("plot3.png", width = 480, height = 480, units = "px")

par (bg="transparent")

plot(df$DateTime, df$Sub_metering_1, type = "l", col = "black", xlab= "",
     ylab= "Energy sub metering")
points(df$DateTime, df$Sub_metering_2, type = "l", col = "red")
points(df$DateTime, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), pch = "___")

dev.off()