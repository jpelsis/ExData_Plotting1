pwrdata <- read.table("./data/power.txt",sep = ";",header = TRUE,na.strings = "?")
pwrdata[,1] <- as.Date(pwrdata[,1],format="%d/%m/%Y")
pwrdata <- pwrdata[pwrdata[,1]>=as.Date("2007-02-01") & pwrdata[,1]<=as.Date("2007-02-02"),]
pwrdata[,2] <- as.character(strptime(paste(as.character(pwrdata[,1]),as.character(pwrdata[,2]),sep=" "),format="%Y-%m-%d %H:%M:%S"))

png(filename = "plot1.png")
hist(pwrdata$Global_active_power,col="red",xlab = "Global Active Power (killowatts)",main="Global Active Power")
dev.off()
