plot1 <- function()
{
        #Unzip the data.
        file <- "exdata-data-household_power_consumption.zip"
        unzip(file, "household_power_consumption.txt")
        
        #Read the data into table object and filter the data needed.
        table <- read.csv("household_power_consumption.txt", sep=";",  
                          na.strings=("?"),
                          colClasses= c("character", "character", "numeric",
                                        "numeric", "numeric", "numeric",
                                        "numeric", "numeric", "numeric"))
        
        table <- subset(table, table$Date == "1/2/2007" | table$Date == "2/2/2007")
        
        #Plot.
        hist(table$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
        dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
        
}