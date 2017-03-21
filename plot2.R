plot2 <- function() {
      ## check that the input file has been downloaded to the current directory
      if (file.exists("household_power_consumption.txt")) {
            power_used <- read.csv(
                  "household_power_consumption.txt",
                  as.is = TRUE,
                  na.strings = "?",
                  sep = ";"
            )
      } else{
            return("File does not exist - exiting")
      }
      ## create a new column by combining the Date and Time strings,
      ## and converting to a POSIXct.
      power_used$Date_Time <-
            as.POSIXct(strptime(paste(power_used$Date, power_used$Time), format = "%d/%m/%Y %H:%M:%S"))
      ## choose a subset of data for the period 2007-02-01 00:00:00 to "2007-02-03 00:00:00" inclusive
      power_used_subset <-
            power_used[power_used$Date_Time >= as.POSIXct("2007-02-01 00:00:00") &
                             power_used$Date_Time < as.POSIXct("2007-02-03 00:00:00"), ]
      ## xyplot
      png(filename = "ExData_Plotting1/plot2.png", width=480, height=480)
      plot(power_used_subset$Date_Time,power_used_subset$Global_active_power,type="l",
           ylab="Global Active Power (kilowatts)", xlab="")
      dev.off()
}