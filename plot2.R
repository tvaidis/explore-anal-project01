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

# Construct Plot2 (no axis labels)------------------------------------------------------
plot(data.df$Global_active_power,type="l",xaxt="n",xlab="",cex.axis=0.8,cex.lab=0.8,
     ylab="Global Active Power (kilowatts)")

# Construct xaxis labels ----
ind_day2 <- which(data.df$Date=="2007-02-02")[1] #- first row with date =="2007-02-02"
xtick_pos.vec <- c(1,ind_day2,length(data.df$Date))
xlabel.vec <- weekdays(data.df$Date[xtick_pos.vec],abbreviate=T)
axis(side=1,at=xtick_pos.vec,labels=xlabel.vec,cex.axis=0.8,cex.lab=0.8)

# Save plot to  plot2.png
dev.copy(device=png,file="plot2.png",width=480,height=480)
dev.off()
