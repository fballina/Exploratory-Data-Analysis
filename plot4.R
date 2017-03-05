# CLEAN ENVIROMENT
rm (list=ls())
# ReADING DATA IN R
datos<-read.table('household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
# SUBSETTING
subdatos<- subset(datos, (datos$Date == "1/2/2007" | datos$Date== "2/2/2007"))
# CHANGE OF THE CLASS OF DATE VARIABLE (FROM CHARACTER TI DATE)
subdatos$Date <- as.Date(subdatos$Date, format = "%d/%m/%Y")

# COMBINING THE DATE AND TIME VARIABLE

subdatos$DateTime <- as.POSIXct(paste(subdatos$Date, subdatos$Time))

# PLOT 4

par(mfcol=c(2,2))
plot(subdatos$DateTime, subdatos$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
plot(subdatos$DateTime, subdatos$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subdatos$DateTime, subdatos$Sub_metering_2, type="l", col="red")
lines(subdatos$DateTime, subdatos$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
plot(subdatos$DateTime,subdatos$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(subdatos$DateTime,subdatos$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

