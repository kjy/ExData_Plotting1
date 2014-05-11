
# Plot 4 R code
# http://cran.r-project.org/web/packages/sqldf/sqldf.pdf
install.packages("sqldf")
require("sqldf")

setwd("/Users/karenyang/Desktop/ExploratoryDataAnalysis")
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
data1 <- read.csv.sql("./household_power_consumption.txt",sep=";",sql=mySql)
dim(data1)
object.size(data1)
print(object.size(data1),units="Mb") # 79.8 Mb
str(data1)

# Create a new variable that has date and time as 1 variable
x <-paste(data1$Date, data1$Time)
data1$dateTime <- as.POSIXct(strptime(paste(data1$Date,data1$Time), "%d/%m/%Y %H:%M:%S", tz="EST"))

# Plot 4


require(graphics)
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
#northwest plot
plot(data1$dateTime,data1$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab="") 

#southwest plot
plot(data1$dateTime,data1$Sub_metering_1,col="black",ylab="Energy sub metering",xlab="",type="l")
lines(data1$dateTime,data1$Sub_metering_2,col="red")
lines(data1$dateTime,data1$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'),y.intersp=0.5,bty='n')

#northeast plot
plot(data1$dateTime,data1$Voltage,type="l",ylab="Voltage",xlab="datetime")

#nsoutheast plot
plot(data1$dateTime,data1$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")


dev.off()
sqldf()