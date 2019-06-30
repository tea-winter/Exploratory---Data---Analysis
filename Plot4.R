### Plot 4: 
#set directory R working
setwd("")
#read data household power consumption
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subset data to plot
plot_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
plot_data$Date <- as.Date(plot_data$Date, format="%d/%m/%Y") #reclass data type to date format dmy
plot_data$datetime <- strptime(paste(plot_data$Date, plot_data$Time), "%Y-%m-%d %H:%M:%S")
plot_data$datetime <- as.POSIXct(plot_data$datetime)

# Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plot_data, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
