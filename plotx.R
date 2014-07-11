##------------------------------------------------------------------------##
## Script for Downloading "Household power consumption data" and drawing  ##
## several example plots                                                  ##
##    Ken Kirby                                                           ##
##    July 10, 2014                                                       ##
##------------------------------------------------------------------------##
## Note that I used a directory "C:/ds/plot1" as local repository - to replicate this,
## create a directory "C:/ds/plot1" and copy in the plotx.R (this file), the plot1.R,
## plot2.R, plot3.R and plot4.R files. Source plotx.R (this file) - for other directory
## structures, adjust your local working directory as necessary

setwd("C:/ds")

power_zip_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
power_zip_filename <- "household_power.zip"
power_dataset_filename  <- "household_power_consumption.txt"

# Starting and Ending dates for required plots
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")

download.file(url=power_zip_url, destfile=power_zip_filename, quiet=F)

# Add a way to default the d/m/Y format at colClasses conversion time - this creates a class and conversion
# function with the appropriate date format
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

# to get classes for use with read.csv colClasses parameter
power_ds <- read.csv(unz(description=power_zip_filename, file=power_dataset_filename), header = TRUE, sep = ";", nrows = 5)
classes <- sapply(power_ds, class)
classes["Date"] <- "myDate"        #<--- specify diy "date converter"
classes["Time"] <- "character"
power_ds <- read.csv(unz(description=power_zip_filename, file=power_dataset_filename), header = TRUE, sep = ";", na.strings = "?", colClasses = classes)

# subset to get only desired rows
power_dsx <- power_ds[power_ds$Date >= start_date & power_ds$Date <= end_date,]
rm(power_ds)
power_dsx["DT"] <- paste(as.character(power_dsx[,1]), power_dsx[,2])    #add column for date manipulation
power_dsx["DT"] <- as.POSIXct(power_dsx$DT,format="%Y-%m-%d %H:%M:%S")

setwd("C:/ds/plot1")

## Plot 1
source('C:/ds/plot1/plot1.R')

## Plot 2
source('C:/ds/plot1/plot2.R')

## Plot 3
source('C:/ds/plot1/plot3.R')

## Plot 4
source('C:/ds/plot1/plot4.R')