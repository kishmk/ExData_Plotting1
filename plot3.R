plot3 <- function()
{
  data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";", header=TRUE, colClasses="character")

  
  datah <- read.table("household_power_consumption.txt",sep=";",header=TRUE, nrows=1)
  names(data) <- names(datah)
  
  data$Date <- paste(data$Date,data$Time)
  data$Date <- strptime(data$Date,format="%d/%m/%Y %H:%M:%S")
  
  png("plot3.png")
  plot(data$Date,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  lines(data$Date,data$Sub_metering_1,type="l")
  lines(data$Date,data$Sub_metering_2,type="l",col="red")
  lines(data$Date,data$Sub_metering_3,type="l",col="blue")
  
  legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
  
}