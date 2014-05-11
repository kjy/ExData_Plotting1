
# Plot 1 R code
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


# Plot 1 
png("plot1.png", width = 480, height = 480)
str(data1$Global_active_power)
hist(data1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
sqldf() # close connection
