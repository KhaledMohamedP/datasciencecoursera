
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
file <- read.table(unz(temp, "household_power_consumption.txt"))
unlink(temp)

file$Date <- as.Date(file$Date, "%d/%m/%Y")
data <- subset(file, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02' )
graphX <- sapply(data$Global_active_powe, as.numeric)
hist(graphX, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "hist1.png",   width = 480, height = 480)
dev.off()