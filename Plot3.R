setwd("C:/Users/Public/Documents/Formazione/Coursera Data Science/4-Explanatory Data Analysis/course project 1")

data <- read.csv("data/household_power_consumption.txt" ,  header=T, 
                 stringsAsFactors=FALSE, sep=';', na.strings="?",dec=".")
data$Data <- as.Date(data$Date, format="%d/%m/%Y")
subdata <- subset(data, subset=(Data >= "2007-02-01" & Data <= "2007-02-02"))
#class(subdata$Date)
#class(subdata$Data)
#head(subdata)
#tail(subdata)       

subdata$datetime<-strptime(paste(subdata$Date, subdata$Time), format="%d/%m/%Y %H:%M:%S")

png(filename = "Plot3.png", width = 480, height = 480)

plot(subdata$datetime , subdata$Sub_metering_1 , type="l",
     xlab="",
     ylab="Energy sub metering")
lines(subdata$datetime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$datetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1,
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"))
dev.off()