library(data.table)
path <- file.path("./","household_power_consumption")
hcp <- data.table(fread(file.path(path, "household_power_consumption.txt")))
head(hcp)
dim(hcp)
hcp$Date <- as.Date.character(hcp$Date, format = "%d/%m/%Y", tryFormats = "%Y-%m-%d")
hcpfeb0102 <- hcp[hcp$Date == "2007-02-01" | hcp$Date == "2007-02-02",]
hcpfeb0102$Global_active_power <- as.numeric(hcpfeb0102$Global_active_power)
#plot 2
hcpfeb0102[, Date.Time := as.POSIXct(paste(Date,Time), format = "%Y-%m-%d %H:%M:%S")]
plot_2 <- with(hcpfeb0102, plot(Date.Time,Global_active_power, type= "l", xlab = "", ylab = "Global Active Power(killowatts)"))