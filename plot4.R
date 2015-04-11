data<-read.table('household_power_consumption.txt',sep=';',header=TRUE)
data$Date<-as.Date(data$Date,'%d/%m/%Y')
data$Date<-format(data$Date,format='%d-%m-%Y')
data1<-subset(data,Date=="01-02-2007"|Date=='02-02-2007')
x<-paste(data1$Date,data1$Time)
datetime<-strptime(x,'%d-%m-%Y %H:%M:%S')
kilowatt<-as.numeric(as.character(data1$Global_active_power))
voltage<-as.numeric(as.character(data1$Voltage))
reactive<-as.numeric(as.character(data1$Global_reactive_power))
submeter_1<-as.numeric(as.character(data1$Sub_metering_1))
submeter_2<-as.numeric(as.character(data1$Sub_metering_2))
submeter_3<-as.numeric(as.character(data1$Sub_metering_3))
#Layout
par(mfrow=c(2,2))
{
#Plot 1
plot(datetime,kilowatt,ylab='Global Active Power',xlab='',type='n')
lines(datetime,kilowatt)
#Plot 2
plot(datetime,voltage,ylab='Voltage',type='n')
lines(datetime,voltage)


#Plot 3
plot(datetime,submeter_1,ylab='Energy sub metering',type='n',xlab='')
lines(datetime,submeter_1,col='black')
lines(datetime,submeter_2,col='red')
lines(datetime,submeter_3,col='blue')
legend(x='topright',lty=1,bty='n',pt.cex=1,cex=0.5,legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'))


#Plot 4
plot(datetime,reactive,ylab='Global_reactive_power',type='n')
lines(datetime,reactive)
}


dev.copy(png,filename='plot4.png',width=480,height=480)
dev.off()