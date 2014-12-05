plot4 <- function() {
    ## This function creates a  plot that is identical to the 
    ## Plot 4 in the assignment. Output is sent to "plot4.png". 
    
    ## PLEASE READ
    ## Call get_data() to download and read the data for this project
    ## The get_data function is defined in an extra file called get_data.R
    ## that is in the same folder. I did this to avoid copying and pasting
    ## identical code in all four plot.R files.
    ## 
    data <- get_data()   
    
    ## Open a png file device for output
    png(filename = "./ExData_Plotting1/plot4.png", 
        width = 480, 
        height = 480, 
        units = "px")
    
    ## This section creates a 2 by 2 grid of plots
    par(mfrow = c(2,2))
 
    ## This creates the plot in the upper left
    plot(data$datetime, 
         data$Global_active_power, 
         type = "l",
         ylab = "Global Active Power",
         xlab = "")
    
    ## This creates the plot in the upper right
    plot(data$datetime, 
         data$Voltage, 
         type = "l",
         ylab = "Voltage",
         xlab = "datetime")
    
    ## This creates the plot in the lower left
    with (data, plot(datetime, Global_active_power, 
                  type = "n", 
                  ylim = c(1, 38),
                  ylab = "Energy sub metering",
                  xlab = ""))
    
    with(subset(data, Sub_metering_1 >= 0), 
         points(datetime, Sub_metering_1, type = "l"))
    with(subset(data, Sub_metering_2 >= 0), 
         points(datetime, Sub_metering_2, type = "l", col = "red"))
    with(subset(data, Sub_metering_3 >= 0), 
         points(datetime, Sub_metering_3, type = "l", col = "blue"))
    legend("topright", 
           lty=1, 
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty='n')
    
    ## This creates the plot in the lower right
    plot(data$datetime, 
         data$Global_reactive_power, 
         type = "l",
         ylab = "Global_reactive_power",
         xlab = "datetime") 
     
    ## Close the device
    dev.off() 
 }