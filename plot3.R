setwd("C:/wendy/R wd")
consumption1<-read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings='?')
consumption<-consumption1[consumption1$Date=='1/2/2007' | consumption1$Date=='2/2/2007',]
x.dates<-consumption$Date
x.times<-consumption$Time
x.datetime<-paste(x.dates,x.times)
y<-strptime(x.datetime, "%d/%m/%Y %H:%M:%S")
y<-as.POSIXlt(y)
write.table(consumption,file='consumption.txt',row.names=FALSE)

setwd("C:/wendy/R wd")
png(file='plot3.png',width=480,height=480,units='px')
lls1<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
lls2<-c('black','red','blue')
plot(y,consumption$Sub_metering_1,type='l',col=lls2[1],xlab='',ylab='Energy sub metering')
lines(y, consumption$Sub_metering_2, col=lls2[2])
lines(y, consumption$Sub_metering_3, col=lls2[3])
legend('topright', legend=lls1, col=lls2, lty='solid')
dev.off()
