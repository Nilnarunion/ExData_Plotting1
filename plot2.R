# Initial step
source("init.R")
data <- init_and_loadData("data/household_power_consumption.txt")

# create line plot across time of global active power
png(file = "plot2.png", width = 1500, height = 1000)
plot(x = data$Time, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
