library(data.table)
path <- file.path("./","household_power_consumption")
hcp <- data.table(fread(file.path(path, "household_power_consumption.txt")))
head(hcp)
dim(hcp)
hcp$Date <- as.Date.character(hcp$Date, format = "%d/%m/%Y", tryFormats = "%Y-%m-%d")
hcpfeb0102 <- hcp[hcp$Date == "2007-02-01" | hcp$Date == "2007-02-02",]
hcpfeb0102$Global_active_power <- as.numeric(hcpfeb0102$Global_active_power)
#plot 3
with(hcpfeb0102,plot(Date.Time,Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subset(hcpfeb0102),points(Date.Time,Sub_metering_2, type = "l", col = "red"))
with(subset(hcpfeb0102),points(Date.Time,Sub_metering_3, type = "l", col = "blue"))
legend(x = "topright", lty = 1, col = c("black", "red", "blue"), cex = 0.8 , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))