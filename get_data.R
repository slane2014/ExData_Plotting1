get_data <- function() {

    ## This is the set_data() function which plot1.R, plot2.R, plot3.R, and 
    ## plot4.R all call to get their data
    
    ## Set the working directory
    setwd("~/datasciencecoursera/Exploratory_Data_Analysis/Project1")
    
    ## Assign the URL to the location of the data 
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    ## Download the file to the local data folder
    download.file(fileURL, destfile="./data/exdata%2Fdata%2Fhousehold_power_consumption.zip", method="curl")
    
    ## Unzip the package in place
    unzip("./data/exdata%2Fdata%2Fhousehold_power_consumption.zip", overwrite = TRUE, exdir = "./data/")
    
    ## Read the unzipped .txt file
    data <- read.csv("./data/Feb_data.txt", sep=";", 
                  colClasses = c("character","character","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric"), 
                  strip.white = TRUE,
                  na.strings = c("?",""),
                  header = TRUE)
    
    ## Merge the two first columns and convert to POSIXct format
    merged <- paste(data$Date, data$Time)
    datetime <- strptime(merged, format = "%d/%m/%Y %H:%M:%S")
    
    ## Remove the Date and Time columns from the date set
    data <- subset(data, select = -c(Date, Time))
    
    ## Add the new datetime column to the data set
    data <- cbind(datetime, data)
}