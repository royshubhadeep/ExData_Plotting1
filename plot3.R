## Script to generate plot#3 for Course Project 1 and write to a png device

colNames <- names(read.table("./data/household_power_consumption.txt", nrow = 1, header = TRUE, sep = ";"))

df <- read.table("./data/household_power_consumption.txt",                        
                 na.strings = "?",                        
                 sep = ";",                        
                 header = FALSE,                        
                 col.names = colNames,                        
                 skip = grep("^[1,2]/2/2007", readLines("./data/household_power_consumption.txt")) - 1,                        
                 nrow = 2880)

## Set device to png
png(file = "plot3.png", width = 480, height = 480)

## Preparing the x axis of the plot
newTime <- strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Generate plot Sub_metering_1
plot(x = newTime, y = df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")

## Adding plot for Sub_metering_2
points(x = newTime, y = df$Sub_metering_2, col = "red", type = "l")

## Adding plot for Sub_metering_3
points(x = newTime, y = df$Sub_metering_3, col = "blue", type = "l")

## Add legend for the plots on top right
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## Set device back to the screen
dev.off()

## Cleanup
rm(colNames, df, newTime)