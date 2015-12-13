#importing the data
w_data=read.table("household_power_consumption.txt",header=TRUE,
           sep=";",na.strings="?",stringsAsFactors=FALSE)

#converting data type from character to date for date column
w_data[,1]=as.Date(w_data[,1],format="%d/%m/%Y")

#subsetting the data
sub_set=w_data[w_data[,1]>="2007-02-01" & w_data[,1]<="2007-02-02",]

#creating the pngfile with the required plot
png(filename="plot1.png",width=480,height = 480)
with(sub_set,hist(Global_active_power,col="red",main="Global Active Power"
                  ,xlab ="Global Active Power(kilowatts)"))
dev.off()