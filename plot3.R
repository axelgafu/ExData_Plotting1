data <- read.table( "household_power_consumption.txt", sep=";", header=TRUE, skip=(16+31)*24*60-(17*60+24), nrows=2*24*60 )
time <- strptime( paste(data[,1], " ", data[,2]), format="%d/%m/%Y %H:%M:%S" )

png( file="plot3.png" )
plot( time, data[,7], ylab="Energy sub metering", xlab="", type="l" )
lines( time, data[,8], col="red")
lines( time, data[,9], col="blue")
legend( "topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1 )

# dev.copy not used because the legend shows up incomplete.
#dev.copy( png, file="plot3.png" )

dev.off()