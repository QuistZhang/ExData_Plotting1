plot3 <- function()
{
        table <- read.csv("household_power_consumption.txt", sep=";",  
                          na.strings=("?"),
                          colClasses= c("character", "character", "numeric",
                                        "numeric", "numeric", "numeric",
                                        "numeric", "numeric", "numeric"))

        table <- subset(table, table$Date == "1/2/2007" | table$Date == "2/2/2007")
        table$Date_Time <- strptime(paste(table$Date, table$Time),"%d/%m/%Y %H:%M:%S")
        
        plot(table$Date_Time, table$Sub_metering_1, type='l', ylab="Energy sub metering", xlab="", cex.axis=0.9, cex.lab=1)
        lines(table$Date_Time, table$Sub_metering_2, type='l', col="red")
        lines(table$Date_Time, table$Sub_metering_3, type='l', col="blue")
        legend(x="topright", legend=c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"), lty=c(1,1,1), col=c("black","red","blue"),  cex=0.95, adj=c(0,0.5), xjust=0.5)
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
}