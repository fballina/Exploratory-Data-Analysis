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

# PLOT 2

plot(subdatos$DateTime, subdatos$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

