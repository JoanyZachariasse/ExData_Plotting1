# PLOT 2

#Read and create dataset
df <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
df <- subset(df, (Date == "1/2/2007") | (Date == "2/2/2007"))


#Convert Date and Time variables
df$DateTime <- strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#Create plot 2
png("plot2.png", width = 480, height = 480, units = "px")

par (bg="transparent")

plot(df$DateTime, df$Global_active_power, type = "l", xlab="", 
     ylab= "Global Active Power (kilowatts)")

dev.off()