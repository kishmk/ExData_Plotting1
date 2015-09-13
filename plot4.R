plot4 <- function()
{
  data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";", header=TRUE, colClasses="character")
  
  
  datah <- read.table("household_power_consumption.txt",sep=";",header=TRUE, nrows=1)
  names(data) <- names(datah)
  
  data$Date <- paste(data$Date,data$Time)
  data$Date <- strptime(data$Date,format="%d/%m/%Y %H:%M:%S")
  
  png("plot4.png")
  par(mfrow=c(2,2))
  with( data,
  {
    plot(Date,Global_active_power,type="l",xlab="", ylab="Global Active Power")
    plot(Date,Voltage,type="l",xlab="datetime",ylab="Voltage")
    plot(Date,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    lines(Date,Sub_metering_1)
    lines(Date,Sub_metering_2,col="red")
    lines(Date,Sub_metering_3,col="blue")
    legend("topright",border="",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(Date,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
  })
  dev.off()
  
}