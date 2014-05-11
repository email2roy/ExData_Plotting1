# data and export file name
datafile <- "household_power_consumption.txt"
filename <- "plot2.png"        

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
plot(trim$datetime,trim$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", pch=20, col="white")
#draw the line
lines(trim$datetime,trim$Global_active_power)
        
# export
dev.off()