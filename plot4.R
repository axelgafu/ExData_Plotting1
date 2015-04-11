data <- read.table( "household_power_consumption.txt", sep=";", header=TRUE, 
                    skip=(16+31)*24*60-(17*60+24), nrows=2*24*60 )
datetime <- strptime( paste(data[,1], " ", data[,2]), format="%d/%m/%Y %H:%M:%S" )
png( file="plot4.png" )

par( mfrow=c(2, 2) ) # Two rows by two columns.

# the Global Active Power chart will be at the top-left space
plot( time, data[,3], type="l", ylab="Global Active Power" )

# the Date-time vs Voltge will be at the top-right space
plot( datetime, data[,5], ylab="Voltage", xlab="", type="l" )

# the Energy sub metering chart will be at the bottom-left space
plot( time, data[,7], ylab="Energy sub metering", type="l" )
lines( time, data[,8], col="red")
lines( time, data[,9], col="blue")
legend( "topright", col=c("black", "red", "blue"), 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
        bty="n" )

# the Date-time vs Voltge will be at the top-right space
plot( datetime, data[,4], ylab="Global_reactive_power", type="l" )

dev.off()
