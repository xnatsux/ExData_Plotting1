# plot3.R - 
# Read data from .txt file, must be in the correct directory
raw.table<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

# prep date and time
raw.table$c<-paste(raw.table$Date,raw.table$Time,sep=" , ") # combine date and time
raw.table$dt<-strptime(raw.table$c,format="%d/%m/%Y , %H:%M:%S") # date and time as a time object, not character
raw.table$d<-as.Date(raw.table$Date, format="%d/%m/%Y") # date as a time object, not character

# subset table by dates
final.table<-subset(raw.table, as.Date(d)>='2007-02-01' & as.Date(d)<='2007-02-02')
final.table$gap<-as.numeric(levels(final.table$Global_active_power))[final.table$Global_active_power] 

# make the histogram with labels as a .png file
png("plot3.png", width = 480, height = 480) # open display device
plot(x=final.table$dt,y=final.table$Sub_metering_1,ylab="Energy sub metering",xlab="",main="",type="l") # make plot with labels
lines(x=final.table$dt,y=final.table$Sub_metering_2, type="l", col=2) # add second data series
lines(x=final.table$dt,y=final.table$Sub_metering_3, type="l", col="blue") # add third data series
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue")) # add legend  # add legend
dev.off() # close display device