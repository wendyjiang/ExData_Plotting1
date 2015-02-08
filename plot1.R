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
png(file='plot1.png',width=480,height=480,units='px')
hist(consumption$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
dev.off()
