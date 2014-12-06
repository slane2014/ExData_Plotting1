get_data <- function() {

    ## This is the set_data() function which plot1.R, plot2.R, plot3.R, and 
    ## plot4.R all call to get their data
    
    library(sqldf)
    
    ## Set the working directory
    setwd("~/datasciencecoursera/Exploratory_Data_Analysis/Project1")
    
    ## If the data is not there, then we need to download and unzip it
    if (!file.exists("./data/household_power_consumption.txt")) {
        ## Assign the URL to the location of the data 
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
        ## Download the file to the local data folder
        download.file(fileURL, destfile="./data/exdata%2Fdata%2Fhousehold_power_consumption.zip", method="curl")
    
        ## Unzip the package in place
        unzip("./data/exdata%2Fdata%2Fhousehold_power_consumption.zip", overwrite = TRUE, exdir = "./data/")
    }
    
    ## Read the unzipped .txt file and only include the data for the two dates of 
    ## interest
    Feb_data<-read.csv2.sql("./data/household_power_consumption.txt", 
                       header = TRUE, 
                       sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'")
                   
    ## Merge the two first columns and convert to POSIXct format
    merged <- paste(Feb_data$Date, Feb_data$Time)
    datetime <- strptime(merged, format = "%d/%m/%Y %H:%M:%S")
    
    ## Remove the Date and Time columns from the date set
    Feb_data <- subset(Feb_data, select = -c(Date, Time))
    
    ## Add the new datetime column to the data set
    Feb_data <- cbind(datetime, Feb_data)
}