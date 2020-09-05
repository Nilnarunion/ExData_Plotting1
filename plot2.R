# Initial step
source("init.R")
data <- init_and_loadData("data/household_power_consumption.txt")

# create line plot across time of global active power
png(file = "plot2.png")
plot(x = data$Time, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
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