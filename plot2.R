# Plot 2 - to execute this plot please run the complete solution via plotx.R
png(filename="plot2.png", width = 480, height=480)
plot(power_dsx$DT, power_dsx$Global_active_power, type="S", xlab= "", ylab="Global Active Power (kilowatts)")
dev.off()
