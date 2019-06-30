### Plot 3: 
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

# Plot 3
with(plot_data, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
