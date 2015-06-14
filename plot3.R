plot3 <- function(){

        f <- file("household_power_consumption.txt")
        dt <- read.table(text = grep("^[1,2]/2/2007",readLines(f), value = TRUE), sep =";" , header = TRUE, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
        dput(dt,"dt.R")
        newDate <- paste(dt$Date,dt$Time,sep = " ")
        newDate <- strptime(newDate, format = "%d/%m/%Y %H:%M:%S")
        
        png(filename ="plot3.png" , width = 480, height = 480)
        plot(newDate,dt$Sub_metering_1,col = "black",type =  "l",xlab = "", ylab = "Energy sub metering")
        lines(newDate,dt$Sub_metering_2,col = "red")
        lines(newDate,dt$Sub_metering_3,col = "blue")
        legend("topright",col = c("black","red","blue"), legend = c("Sub_metering1","Sub_metering2","Sub_metering3"), lty = c(1,1,1))
        dev.off()
        close(f)

        
        
}