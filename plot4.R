plot4 <- function(){
        
        f <- file("household_power_consumption.txt")
        dt <- read.table(text = grep("^[1,2]/2/2007",readLines(f), value = TRUE), sep =";" , header = TRUE, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
        dput(dt,"dt.R")
        newDate <- paste(dt$Date,dt$Time,sep = " ")
        newDate <- strptime(newDate, format = "%d/%m/%Y %H:%M:%S")
        
        png(filename = "plot4.png" , width=480 , height= 480)
        par(mfrow = c(2,2))
        with(dt, {plot(newDate,as.numeric(dt$Global_active_power), type = "l", xlab = "", ylab= "Global Active Power")
                  plot(newDate,as.numeric(dt$Voltage), type = "l", xlab ="datetime" , ylab="Voltage")
                  plot(newDate,dt$Sub_metering_1,col = "red",type =  "l", xlab="" , ylab="Energy sub metering")
                  lines(newDate,dt$Sub_metering_2,col = "blue")
                  lines(newDate,dt$Sub_metering_3,col = "black")
                  
                  plot(newDate,as.numeric(dt$Global_reactive_power), type = "l", ylab="Global_reactive_power" , xlab="datetime")})
        
        dev.off()
        close(f)
}