plot3 <- function() {
    ## This function creates a  plot that is identical to the 
    ## Plot 3 in the assignment. Output is sent to "plot3.png". 
    
    ## PLEASE READ
    ## Call get_data() to download and read the data for this project
    ## The get_data function is defined in an extra file called get_data.R
    ## that is in the same folder. I did this to avoid copying and pasting
    ## identical code in all four plot.R files.
    ## 
    x <- get_data()   
        
    ## Open a png file device for output
    png(filename = "./ExData_Plotting1/plot3.png", 
        width = 480, 
        height = 480, 
        units = "px")
      
    ## Start plot, but use type = "N" to delay output to "points" command below
    with (x, plot(datetime, Global_active_power, 
         type = "n", 
         ylim = c(1, 38),
         ylab = "Energy sub metering",
         xlab = ""))
 
    with(subset(x, Sub_metering_1 >= 0), 
             points(datetime, Sub_metering_1, type = "l"))
    with(subset(x, Sub_metering_2 >= 0), 
             points(datetime, Sub_metering_2, type = "l", col = "red"))
    with(subset(x, Sub_metering_3 >= 0), 
             points(datetime, Sub_metering_3, type = "l", col = "blue"))
    legend("topright", 
           lty=1, 
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## Close the device
    dev.off() 
 }