# data and export file name
datafile <- "household_power_consumption.txt"
filename <- "plot1.png"        

#read original txt file & convert Date to date type
data <- read.csv(datafile, sep=";",na.strings = "?")
data$Date2 <- as.Date(data$Date, "%d/%m/%Y")

# prepare data - trim only date between 2007-02-01 & 2007-02-02
trim <- data[data$Date2 >= as.Date("1/2/2007","%d/%m/%Y") & data$Date2 <= as.Date("2/2/2007","%d/%m/%Y"),]
# create datetime in one field
trim$datetime <- strptime(paste(trim$Date," ",trim$Time), format="%d/%m/%Y %H:%M:%S")

# init device
png(file=filename)
        
#name the xaces
xaxes <- "Global Active Power (kilowatts)"
hist(trim$Global_active_power,main="Global Active Power", col="red",xlab="Global Active Power (kilowatts)")

#export
dev.off()
