# Initial step
source("init.R")
data <- init_and_loadData("data/household_power_consumption.txt")

# Create sub metering line plots
png(file = "plot3.png")
with(data, {
  plot(x = Time, y = Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(x = Time, y = Sub_metering_2, type = "l", col = "red")
  lines(x = Time, y = Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()

init_and_loadData <- function(bemenet = "data/household_power_consumption.txt"){
  # load dplyr package
  library(dplyr) 
  
  # get data
  raw_data <- read.table(bemenet, header=TRUE, sep= ";", na.strings = c("?",""))
  
  # create truncated dataset by subsetting specified dates
  data <- raw_data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
  
  # convert date and time to proper formats
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data$timetemp <- paste(data$Date, data$Time)
  data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")
  data %>% select(-Date, -timetemp)
}