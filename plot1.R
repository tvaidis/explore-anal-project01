#-- Read the data for days 2007-02-01 and 2007-02-02

# rm(list=ls())

#-- Read data up to 2007-02-02 
data.df <- read.table(file="household_power_consumption.txt",header=T,sep=";",
                      nrows=70000,na.strings="?",stringsAsFactors=F,
                      colClasses=c("character","character",rep("numeric",7)))

#-- Select data for days 2007-02-01 and 2007-02-02
ind <- which(data.df$Date %in% c("1/2/2007","2/2/2007"))

#-- Add one extra entry for the day "3/2/2007" at time 00:00:00
ind <- c(ind,ind[length(ind)]+1)
data.df <- data.df[ind,]

# Construct Plot1 and save to plot1.png------------------------------------------------------
hist(data.df$Global_active_power,col='red',cex.axis=0.9,cex.lab=0.9,
     xlab="Global Active Power (kilowatts)")
dev.copy(device=png,file="plot1.png",width=480,height=480)
dev.off()
