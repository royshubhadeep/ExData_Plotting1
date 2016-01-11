## Script to generate plot#4 for Course Project 1 and write to a png device

colNames <- names(read.table("./data/household_power_consumption.txt", nrow = 1, header = TRUE, sep = ";"))

df <- read.table("./data/household_power_consumption.txt",                        
                 na.strings = "?",                        
                 sep = ";",                        
                 header = FALSE,                        
                 col.names = colNames,                        
                 skip = grep("^[1,2]/2/2007", readLines("./data/household_power_consumption.txt")) - 1,                        
                 nrow = 2880)

## Set device to png
png(file = "plot4.png", width = 480, height = 480)

## Preparing the x axis of the plot
newTime <- strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Configure the plotting area
par(mfrow = c(2, 2))


## Generate plot Top-Left
plot(x = newTime, y = df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")


## Generate plot Top-Right
plot(x = newTime, y = df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", col = "black")


## Generate plot Bottom-Left
## Sub_metering_1
plot(x = newTime, y = df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")

## Sub_metering_2
points(x = newTime, y = df$Sub_metering_2, col = "red", type = "l")

## Sub_metering_3
points(x = newTime, y = df$Sub_metering_3, col = "blue", type = "l")

## Add legend for the plots on top right
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))


## Generate plot Bottom-Right
plot(x = newTime, y = df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", col = "black")


## Set device back to the screen
dev.off()

## Cleanup
rm(colNames, df, newTime)