### Plot 1: 
#set directory R working
setwd("")
#read data household power consumption
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subset data to plot
plot_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
plot_data$Date <- as.Date(plot_data$Date, format="%d/%m/%Y") #reclass data type to date format dmy
# Plot 1 histogram 
hist(plot_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save as png file
png("Plot_1.png", width=480, height=480)
dev.off()
