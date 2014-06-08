plot2 <- function()
{
        table <- read.csv("household_power_consumption.txt", sep=";",  
                          na.strings=("?"),
                          colClasses= c("character", "character", "numeric",
                                        "numeric", "numeric", "numeric",
                                        "numeric", "numeric", "numeric"))
        
        table <- subset(table, table$Date == "1/2/2007" | table$Date == "2/2/2007")
        table$Date_Time <- strptime(paste(table$Date, table$Time),"%d/%m/%Y %H:%M:%S")
        
        plot(table$Date_Time,table$Global_active_power,type='l',main="",ylab="Global Active Power (kilowatts)",xlab="")
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
}