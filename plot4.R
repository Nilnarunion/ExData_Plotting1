# Initial step
source("init.R")
data <- init_and_loadData("data/household_power_consumption.txt")

# Create sub metering line plots
png(file = "plot4.png", width = 1500, height = 1000)
par(mfrow = c(2, 2))
with(data, {
  plot(x = Time, y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(x = Time, y = Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(x = Time, y = Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(x = Time, y = Sub_metering_2, type = "l", col = "red")
  lines(x = Time, y = Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(x = Time, y = Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()