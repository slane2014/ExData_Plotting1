plot2 <- function() {
    ## This function creates a  plot that is identical to the 
    ## Plot 2 in the assignment. Output is sent to "plot2.png". 
    
    ## PLEASE READ
    ## Call get_data() to download and read the data for this project
    ## The get_data function is defined in an extra file called get_data.R
    ## that is in the same folder. I did this to avoid copying and pasting
    ## identical code in all four plot.R files.
    ## 
    data <- get_data()   
        
    ## Open a png file device for output
    png(filename = "./ExData_Plotting1/plot2.png", 
        width = 480, 
        height = 480, 
        units = "px")
    
    ## Create plot
    plot(data$datetime, 
         data$Global_active_power, 
         type = "l",
         ylab = "Global Active Power (kilowatts)",
         xlab = "")
    
    ## Close the device
    dev.off() 
 }