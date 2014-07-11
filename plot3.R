# Plot 3 - to execute this plot please run the complete solution via plotx.R
png(filename="plot3.png", width = 480, height=480)
with(power_dsx, plot(DT, Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n"))
with(power_dsx, points(DT, Sub_metering_1, type = "s", col = "black"))
with(power_dsx, points(DT, Sub_metering_2, type = "s", col = "blue"))
with(power_dsx, points(DT, Sub_metering_3, type = "s", col = "red"))
legend("topright", lwd = 1, col = c("black","blue", "red"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
dev.off()