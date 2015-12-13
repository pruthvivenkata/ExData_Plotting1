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
png(filename="plot2.png",width=480,height = 480)
with(sub_set,plot(date_time,Global_active_power,type="l",xlab="",
                  ylab="Global Active Power(kilowatts)"
                  ))
dev.off()