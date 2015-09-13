plot2 <- function()
{
  data2<- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep=";",colClasses="character",header=TRUE)
  
  data2h<-read.table("household_power_consumption.txt",sep=";",nrows=1,header=TRUE)
  names(data2)<-names(data2h)
    
  data2$Date<-paste(data2$Date,data2$Time)
  data2$Date<-strptime(data2$Date,format="%d/%m/%Y %H:%M:%S")
  
  #data2$Day <- weekdays(data2$Date)
 
  png("plot2.png")
  plot(data2$Date, as.numeric(data2$Global_active_power),  type="l",xlab="",ylab="Global Active Power (kilowatts)")
  #axis(1,at=c(labels=levels(data2$Day))
  dev.off()
    
}