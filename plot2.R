## Script to generate plot#2 for Course Project 1 and write to a png device

colNames <- names(read.table("./data/household_power_consumption.txt", nrow = 1, header = TRUE, sep = ";"))

df <- read.table("./data/household_power_consumption.txt",                        
                 na.strings = "?",                        
                 sep = ";",                        
                 header = FALSE,                        
                 col.names = colNames,                        
                 skip = grep("^[1,2]/2/2007", readLines("./data/household_power_consumption.txt")) - 1,                        
                 nrow = 2880)

png(file = "plot2.png", width = 480, height = 480)

## Preparing the x axis of the plot
newTime <- strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Generate plot
plot(x = newTime, y = df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", col = "black")

## Set device back to the screen
dev.off()

## Cleanup
rm(colNames, df, newTime)