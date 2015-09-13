plot1 <- function()
{
  
  data <- read.table(pipe('grep "^[1-2]/2/2007" "../household_power_consumption.txt"'),sep=";",colClasses="character",header=T)
  data
  datah <- read.table("../household_power_consumption.txt",sep=";",nrows=1,header=T)
  names(data)<-names(datah)
  png(file="plot1.png")
  hist(as.numeric(data$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="RED")
  dev.off()
}
