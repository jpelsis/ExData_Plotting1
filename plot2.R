pwrdata <- read.table("./data/power.txt",sep = ";",header = TRUE,na.strings = "?")
pwrdata[,1] <- as.Date(pwrdata[,1],format="%d/%m/%Y")
pwrdata <- pwrdata[pwrdata[,1]>=as.Date("2007-02-01") & pwrdata[,1]<=as.Date("2007-02-02"),]
pwrdata[,2] <- as.character(strptime(paste(as.character(pwrdata[,1]),as.character(pwrdata[,2]),sep=" "),format="%Y-%m-%d %H:%M:%S"))

ts_apwr <- as.ts(pwrdata$Global_active_power)

png(filename = "plot2.png")
plot(ts_apwr,xaxt="n",ylab="Global Active Power (killowatts)",xlab="")
axis(side=1,at=c(1,length(ts_apwr)*0.5,length(ts_apwr)),labels=c("Thu","Fri","Sat"),xlab="")
dev.off()
