# Plot 1 - to execute this plot please run the complete solution via plotx.R
png(filename="plot1.png", width = 480, height=480)
hist(power_dsx$Global_active_power, xlab="Global Active Power (Kilowatts)", col="Red", main="Global Active Power")
dev.off()