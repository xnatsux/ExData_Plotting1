# plot1.R - Histogram on Global Active Power
# Read data from .txt file, must be in the correct directory
raw.table<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

# prep date and time
raw.table$c<-paste(raw.table$Date,raw.table$Time,sep=" ") # combine date and time
raw.table$dt<-as.POSIXct(raw.table$c,format="%d/%m/%Y %H:%M:%S") # date and time as a time object, not character
raw.table$d<-as.Date(raw.table$Date, format="%d/%m/%Y") # date as a time object, not character

# subset table by dates
final.table<-subset(raw.table, as.Date(d)>='2007-02-01' & as.Date(d)<='2007-02-02')
final.table$gap<-as.numeric(levels(final.table$Global_active_power))[final.table$Global_active_power] 

# make the histogram with labels as a .png file
png("plot1.png", width = 480, height = 480)
hist((final.table$gap),main="Global Active Power",xlab="Global Active Power (kilowatts)", col=2) # make histogram with labesl
dev.off() # close display device