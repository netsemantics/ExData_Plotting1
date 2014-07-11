# Plot 4 - to execute this plot please run the complete solution via plotx.R
png(filename="plot4.png", width = 480, height=480)
par(mfrow = c(2,2))
with(power_dsx, {
plot(DT, power_dsx$Global_active_power, type="S", xlab= "", ylab="Global Active Power")
plot(DT, power_dsx$Voltage, type="S", xlab= "datetime", ylab="Voltage")
plot(DT, Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n")
  points(DT, Sub_metering_1, type = "s", col = "black")
  points(DT, Sub_metering_2, type = "s", col = "blue")
  points(DT, Sub_metering_3, type = "s", col = "red")
  legend("topright", lwd = 1, col = c("black","blue", "red"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
plot(DT, Global_reactive_power, type="S", xlab= "datetime", ylab="Global Reactive Power")
})
dev.off()