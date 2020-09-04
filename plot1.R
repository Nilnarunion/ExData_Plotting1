# Initial step
source("init.R")
data <- init_and_loadData("data/household_power_consumption.txt")

# create histogram of global active power
png(file = "plot1.png", width = 1500, height = 1000)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
