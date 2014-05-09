#-- Read the data for days 2007-02-01 and 2007-02-02
# rm(list=ls())

#-- Read data up to 2007-02-02 
data.df <- read.table(file="household_power_consumption.txt",header=T,sep=";",
                      nrows=70000,
                      na.strings="?",stringsAsFactors=F,
                      colClasses=c("character","character",rep("numeric",7)),)

#-- Select data for days 2007-02-01 and 2007-02-02
ind <- which(data.df$Date %in% c("1/2/2007","2/2/2007"))

#-- Add one extra entry for the day "3/2/2007" at time 00:00:00
ind <- c(ind,ind[length(ind)]+1)
data.df <- data.df[ind,]
data.df$Date <- as.Date(x=data.df$Date,format="%d/%m/%Y")

# Construct Plot3 (no axis labels) --------------------------------------------------
plot(data.df$Sub_metering_1,type="l",xaxt="n",xlab="",col='black',cex.axis=0.8,cex.lab=0.8, ylab="Energy sub metering")
lines(data.df$Sub_metering_2,type="l",xaxt="n",xlab="",col='red',cex.axis=0.8)
lines(data.df$Sub_metering_3,type="l",xaxt="n",xlab="",col='blue',cex.axis=0.8)

# Construct xaxis labels ----
ind_day2 <- which(data.df$Date=="2007-02-02")[1] #- first row with date =="2007-02-02"
xtick_pos.vec <- c(1,ind_day2,length(data.df$Date))
xlabel.vec <- weekdays(data.df$Date[xtick_pos.vec],abbreviate=T)
axis(side=1,at=xtick_pos.vec,labels=xlabel.vec,cex.axis=0.8,cex.lab=0.8)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, 
       col=c("black","red","blue"),cex=0.8)


# Save plot to  plot3.png
dev.copy(device=png,file="plot3.png",width=480,height=480)
dev.off()






