# data and export file name
datafile <- "household_power_consumption.txt"
filename <- "plot3.png"        

#read original txt file & convert Date to date type
data <- read.csv(datafile, sep=";",na.strings = "?")
data$Date2 <- as.Date(data$Date, "%d/%m/%Y")

# init device
png(file=filename)

# prepare data - trim only date between 2007-02-01 & 2007-02-02
trim <- data[data$Date2 >= as.Date("1/2/2007","%d/%m/%Y") & data$Date2 <= as.Date("2/2/2007","%d/%m/%Y"),]
# create datetime in one field
trim$datetime <- strptime(paste(trim$Date," ",trim$Time), format="%d/%m/%Y %H:%M:%S")

#Plot invisble points
plot(trim$datetime,trim$Sub_metering_1, xlab="", ylab="Energy sub metering", pch=20, col="white")
#draw the line
lines(trim$datetime,trim$Sub_metering_1, col="black")
        
#Plot invisble points
points(trim$datetime,trim$Sub_metering_2, xlab="", ylab="Energy sub metering", pch=20, col="white")
#draw the line
lines(trim$datetime,trim$Sub_metering_2, col="red")
        
#Plot invisble points
points(trim$datetime,trim$Sub_metering_3, xlab="", ylab="Energy sub metering", pch=20, col="white")
#draw the line
lines(trim$datetime,trim$Sub_metering_3, col="blue")
        
# draw the legend
legend('topright',lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
#export
dev.off()
