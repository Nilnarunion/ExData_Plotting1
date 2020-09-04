# Initial step
source("init.R")
data <- init_and_loadData("data/household_power_consumption.txt")

# Create sub metering line plots
png(file = "plot3.png", width = 1500, height = 1000)
with(data, {
  plot(x = Time, y = Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(x = Time, y = Sub_metering_2, type = "l", col = "red")
  lines(x = Time, y = Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()