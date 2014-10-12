# plot2.R - 
# Read data from .txt file, must be in the correct directory
raw.table<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

# prep date and time
raw.table$c<-paste(raw.table$Date,raw.table$Time,sep=" , ") # combine date and time
raw.table$dt<-strptime(raw.table$c,format="%d/%m/%Y , %H:%M:%S") # date and time as a time object, not character
raw.table$d<-as.Date(raw.table$Date, format="%d/%m/%Y") # date as a time object, not character

# subset table by dates
final.table<-subset(raw.table, as.Date(d)>='2007-02-01' & as.Date(d)<='2007-02-02')
final.table$gap<-as.numeric(levels(final.table$Global_active_power))[final.table$Global_active_power] 

# make the GAP plot with labels as a .png file
png("plot2.png", width = 480, height = 480) # open display device
plot(x=final.table$dt,y=final.table$gap,ylab="Global Active Power (kilowatts)",xlab="",main="",type="l") # make plot with labels
dev.off() # close display device