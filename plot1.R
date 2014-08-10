## load library
install.packages('sqldf')
library(sqldf)

## make a path and file string
fn<-"household_power_consumption.txt"

## read file and select rows based on string "1/1/2007" and store in dataframe DF
data <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')

## doing the graph and exporting it to a png file
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col='red', main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()