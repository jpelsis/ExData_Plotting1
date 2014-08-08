pwrdata <- read.table("./data/power.txt",sep = ";",header = TRUE,na.strings = "?")
pwrdata[,1] <- as.Date(pwrdata[,1],format="%d/%m/%Y")
pwrdata <- pwrdata[pwrdata[,1]>=as.Date("2007-02-01") & pwrdata[,1]<=as.Date("2007-02-02"),]
pwrdata[,2] <- as.character(strptime(paste(as.character(pwrdata[,1]),as.character(pwrdata[,2]),sep=" "),format="%Y-%m-%d %H:%M:%S"))

ts_sub1 <- as.ts(pwrdata$Sub_metering_1)
ts_sub2 <- as.ts(pwrdata$Sub_metering_2)
ts_sub3 <- as.ts(pwrdata$Sub_metering_3)

png(filename = "plot3.png")
plot(ts_sub1,xaxt="n",ylab="Energy sub metering",xlab="",type="n")
lines(ts_sub1,col="black")
lines(ts_sub2,col="red")
lines(ts_sub3,col="blue")
axis(side=1,at=c(1,length(ts_sub1)*0.5,length(ts_sub1)),labels=c("Thu","Fri","Sat"),xlab="")
legend("topright",legend = c(names(pwrdata[,7:9])),col=c("black","red","blue"),lty=1)
dev.off()
