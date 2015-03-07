# First plot: histogram of the variable 'Global_active_power' for the Household power consumption data
# on the days 2007-02-01 to 2007-02-02

# setwd("D:/workspace/DataScienceSpecial/EDA/assessment1/ExData_Plotting1")
# Use data.table instead of data.frame
library(data.table)

# read the whole data on file
electric <- fread("../household_power_consumption.txt", na.strings='?')

# subselect the data for the days 2007-02-01 to 2007-02-02
el <- electric[Date=='1/2/2007' | Date=='2/2/2007']

# coerce the column 'Global_active_power' from char to numeric in order to plot frequencies
el[, Global_active_power := as.numeric(Global_active_power)]

# histogram (added some further elements to make the plot more informative)
hist(el$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
rug(el$Global_active_power)
abline(v = median(el$Global_active_power), col = 'magenta', lwd=3, lty=2)

# Copy the plot to the PNG file device
dev.copy(png, file="plot1.png", width=480, height=480, units='px')
dev.off()