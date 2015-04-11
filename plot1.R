data <- read.table( "household_power_consumption.txt", sep=";", header=TRUE, skip=(16+31)*24*60-(17*60+24), nrows=2*24*60 )
hist(data[,3], xlab="Global Active Power (kilowats)", main="Global Active Power", col="red")
dev.copy( png, file="plot1.png" )
dev.off()