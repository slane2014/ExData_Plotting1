plot3 <- function() {
    
    ## References: 
    ## as.Date, strptime: http://rfunction.com/archives/1912
    
    
    ## Set the working directory
    setwd("~/datasciencecoursera/Exploratory_Data_Analysis/Project1")
    
    ## Assign the URL to the location of the data 
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    download.file(fileURL, destfile="./data/exdata%2Fdata%2Fhousehold_power_consumption.zip", method="curl")
 
    ## Unzip the package in place
    unzip("./data/exdata%2Fdata%2Fhousehold_power_consumption.zip", overwrite = TRUE, exdir = "./data/")
        
    dateDownloaded <- date()
    dateDownloaded
    
    
    ## Still need to add code to get data to this state
    
    
    library(datasets)
    
    
    x <- read.csv("./data/Feb_data.txt", sep=";", 
                  colClasses = c("character","character","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric"), 
                  strip.white = TRUE,
                  na.strings = c("?",""),
                  header = TRUE)
    
    merged <- paste(x$Date, x$Time)
    Date_Time <- strptime(merged, format = "%d/%m/%Y %H:%M:%S")

    ## Remove the Date and Time columns from the date set
    x <- subset(x, select = -c(Date, Time))

    ## Add the new Date_Time column to the data set
    x <- cbind(Date_Time, x)
    
    ## Create plot and send to a file (no plot appears on screen)
#    with (x, plot(Date_Time, Global_active_power, 
#                  type = "n")
#                  ylim = c(1, 38))
   with (x, plot(Date_Time, Global_active_power, 
               type = "n"), ylim = c(1, 38))

    with(subset(x, Sub_metering_1 >= 0), points(Date_Time, Sub_metering_1, type = "l"))
    with(subset(x, Sub_metering_2 >= 0), points(Date_Time, Sub_metering_2, type = "l", col = "red"))
    with(subset(x, Sub_metering_3 >= 0), points(Date_Time, Sub_metering_3, type = "l", col = "blue"))
    title(xlab = "Energy sub metering")
    title(ylab = "Energy sub metering")
    legend("topright", 
           lty=1, 
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## Copy the screen to a PNG file and close the device
    dev.copy(png, file = "./ExData_Plotting1/plot3.png")
    dev.off() 
 }