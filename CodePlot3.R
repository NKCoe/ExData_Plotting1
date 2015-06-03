setwd("/Users/nat/Desktop/Coursera-Data Science/4_Exploratory Data Analysis/Project1/")
#Download the data
#name columns
col <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data<- read.table("data.txt",header=TRUE,sep=";",na.strings="?",col.names= col,
                  skip=66637,nrows= 2879 )
#change date and time columns from type factor to character
data[,1]<-as.character(data[,1])
data[,2]<-as.character(data[,2])
#create column with combined formatted date and time
data$DaTi <- strptime(paste(data$Date,data$Time),format= "%d/%m/%Y %H:%M:%S",
                      tz="UTC")
#move DateTime to first column
data <- cbind(data$DaTi,data)

#plot3
png(filename="Plot3.png",width=480,height=480)
plot(data[,1],data[,8],type="l",ylab="Energy sub metering",xlab="")
lines(data[,1],data[,9],col="Red")
lines(data[,1],data[,10],col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=c(1,2,3),ncol=1)

dev.off()
