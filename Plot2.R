### Plot 2: 
#set directory R working
setwd("")
#read data household power consumption
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subset data to plot
plot_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
plot_data$Date <- as.Date(plot_data$Date, format="%d/%m/%Y") #reclass data type to date format dmy

# Convert dates and times
plot_data$datetime <- strptime(paste(plot_data$Date, plot_data$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2
plot_data$datetime <- as.POSIXct(plot_data$datetime)
attach(plot_data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "Plot_2.png", height = 480, width = 480)
dev.off()
detach(plot_data)
