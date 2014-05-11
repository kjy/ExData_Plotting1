
# Plot 3 R code
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

# Plot 3
png("plot3.png", width = 480, height = 480)
require(graphics)
plot(data1$dateTime,data1$Sub_metering_1,col="black",ylab="Energy sub metering",xlab="",type="l")
lines(data1$dateTime,data1$Sub_metering_2,col="red")
lines(data1$dateTime,data1$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'), cex=.75)

dev.off()
sqldf()

