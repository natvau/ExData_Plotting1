## load library
install.packages('sqldf')
library(sqldf)

## make a path and file string
fn<-"household_power_consumption.txt"

## read file and select rows based on string "1/1/2007" and store in dataframe DF
data <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')

## doing the graph and exporting it to a png file
png(filename = "plot3.png", width = 480, height = 480)
time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
plot(time, data$Sub_metering_1, ylab = "Energy sub metering", xlab='', type='n')
colors = c("black", "red", "blue")
lines(time, data$Sub_metering_1, col=colors[1])
lines(time, data$Sub_metering_2, col=colors[2])
lines(time, data$Sub_metering_3, col=colors[3])
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=colors)
dev.off()