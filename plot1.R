plot1 <- function() {
    
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
    
    ## Create plot 
    hist(x$Global_active_power, 
         main = paste("Global Active Power"), 
         col = "red", 
         xlab = "Global Active Power (kilowatts)")
    
    ## Copy the screen to a PNG file and close the device
    dev.copy(png, file = "./ExData_Plotting1/plot1.png")
    dev.off() 
}