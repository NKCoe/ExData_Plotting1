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

#plot4
png(filename="Plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(data,
{
        #1
        plot(data[,1],data[,4],type="l", ylab="Global Active Power",xlab="" )
        #2
        plot(data[,1],data[,6],type="l",ylab="Voltage",xlab="DateTime")
        #3
        plot(data[,1],data[,8],type="l",ylab="Energy sub metering",xlab="")
        lines(data[,1],data[,9],col="Red")
        lines(data[,1],data[,10],col="Blue")
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               col=c("black","red","blue"),lwd=c(1,2,3),ncol=1,bty="n")
        #4
        plot(data[,1],data[,5],type="l",xlab="DateTime",ylab="Global Reactive Power")
        #Main title outside
        mtext("Plot4",outer=TRUE)
})
dev.off()