## load library
install.packages('sqldf')
library(sqldf)

## make a path and file string
fn<-"household_power_consumption.txt"

## read file and select rows based on string "1/1/2007" and store in dataframe DF
data <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')

## doing the graph and exporting it to a png file
png(filename = "plot2.png", width = 480, height = 480)
plot(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab='', type="l")
dev.off()
