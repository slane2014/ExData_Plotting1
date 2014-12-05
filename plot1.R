plot1 <- function() {
    ## This function creates a histogram plot that is identical to the 
    ## Plot 1 in the assignment. Output is sent to "plot1.png". 
    
    ## PLEASE READ
    ## Call get_data() to download and read the data for this project
    ## The get_data function is defined in an extra file called get_data.R
    ## that is in the same folder. I did this to avoid copying and pasting
    ## identical code in all four plot.R files.
    ## 
    x <- get_data()   
    
    ## Open a png file device for output
    png(filename = "./ExData_Plotting1/plot1.png", 
        width = 480, 
        height = 480, 
        units = "px")
    
    ## Create histogram plot 
    hist(x$Global_active_power, 
         main = paste("Global Active Power"), 
         col = "red", 
         xlab = "Global Active Power (kilowatts)")
 
    ## Close the device
    dev.off() 
}