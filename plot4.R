#importing the data
w_data=read.table("household_power_consumption.txt",header=TRUE,
                  sep=";",na.strings="?",stringsAsFactors=FALSE)

#converting data type from character to date for date column
w_data[,1]=as.Date(w_data[,1],format="%d/%m/%Y")

#subsetting the data
sub_set=w_data[w_data[,1]>="2007-02-01" & w_data[,1]<="2007-02-02",]

#combining the date and time columns to create date_time column
sub_set$date_time=with(sub_set,paste(sub_set[,1],sub_set[,2]))

#formatting the date_time coulmn to POSIXlt type
sub_set$date_time=strptime(sub_set$date_time,format="%Y-%m-%d %H:%M:%S" )

#creating the pngfile with the required plot
png(filename="plot4.png",width=480,height = 480)
par(mfrow=c(2,2))
with(sub_set, 
     {
       plot(date_time,Global_active_power,type="l",xlab="",
                         ylab="Global Active Power")
       
       plot(date_time,Voltage,type="l",xlab="Datetime",
                         ylab="voltage")
       
       
       plot(date_time,Sub_metering_1,type="l",xlab="",
           ylab="Energy sub metering")
       lines(date_time,Sub_metering_2,col="red")
       lines(date_time,Sub_metering_3,col="blue")
       legend("topright",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

     plot(date_time,Global_reactive_power,type="l",xlab="Datetime",
     ylab="Global Reactive Power")
})

dev.off()
