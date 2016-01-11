## Script to generate plot#1 for Course Project 1 and write to a png device

colNames <- names(read.table("./data/household_power_consumption.txt", nrow = 1, header = TRUE, sep = ";"))

df <- read.table("./data/household_power_consumption.txt",                        
                 na.strings = "?",                        
                 sep = ";",                        
                 header = FALSE,                        
                 col.names = colNames,                        
                 skip = grep("^[1,2]/2/2007", readLines("./data/household_power_consumption.txt")) - 1,                        
                 nrow = 2880)

## Set device back to png
png(file = "plot1.png", width = 480, height = 480)

## Generate plot
hist(df$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

## Set device back to the screen
dev.off()

## Cleanup
rm(colNames, df)