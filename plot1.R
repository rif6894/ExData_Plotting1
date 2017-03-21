plot1 <- function() {
      ## Check that the input file has been downloaded to the current directory
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
      ## plot the histogram
      ## open the PNG file of size 450 x 450
      png(filename = "ExData_Plotting1/plot1.png", width=480, height=480)
      hist(
            power_sub_set$Global_active_power,
            xlab = "Global Active Power (kilowatts)",
            col = "red",
            main = "Global Active Power"
      )
      dev.off()
      
}