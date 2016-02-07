##copy data files into the same folder of working directory
setwd("./r_projects/t4assignments")
getwd()

df<-read.csv("household_power_consumption.txt", sep=";", header=T)
df$Date<-as.Date(as.character(df$Date),format = "%d/%m/%Y")
df<-subset(df,Date>=as.Date("2/1/2007",,format = "%m/%d/%Y") & Date<=as.Date("2/2/2007",,format = "%m/%d/%Y"))
df$Global_active_power<-as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1<-as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2<-as.numeric(as.character(df$Sub_metering_2))
df$Voltage<-as.numeric(as.character(df$Voltage))
df$Global_reactive_power<-as.numeric(as.character(df$Global_reactive_power))
df$dt_value<-as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

##plot 3
par(mfrow=c(1,1))

plot(df$dt_value,df$Sub_metering_1, type="l",col="black",xlab="",ylab="Energy sub metering")
lines(df$dt_value,df$Sub_metering_2, type="l",col="red")
lines(df$dt_value,df$Sub_metering_3, type="l",col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=names(df[,7:9]))
dev.copy(png, file="plot3.png",width = 480, height = 480)
dev.off()