install.packages("data.table")
library(data.table)
path <- file.path("./","household_power_consumption")
hcp <- data.table(fread(file.path(path, "household_power_consumption.txt")))
head(hcp)
dim(hcp)
hcp$Date <- as.Date.character(hcp$Date, format = "%d/%m/%Y", tryFormats = "%Y-%m-%d")
hcpfeb0102 <- hcp[hcp$Date == "2007-02-01" | hcp$Date == "2007-02-02",]
hcpfeb0102$Global_active_power <- as.numeric(hcpfeb0102$Global_active_power)
#plot 1
plot_1 <- with(hcpfeb0102, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power(killowatts)", col = "red"))