#Setting Working directory

setwd("C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week2/Assignment1/rprog_data_specdata/specdata")

#Create directory named "specdata" !

dir.create("C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week2/Assignment1/rprog_data_specdata/specdata", showWarnings = TRUE, recursive = FALSE)

## This is my function. 
##########################

pollutantmean <- function(directory,pollutant, id=1:332){

directory <- "C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week2/Assignment1/rprog_data_specdata/specdata"
  
data <- data.frame()
files <- list.files(directory, full.names = TRUE)
for(i in id) {
  data <- rbind(data, read.csv(files[i]))
} 
Answer<-c() 
Answer<-mean(data[[pollutant]],na.rm=TRUE)
Answer  

}
###########################

##Testing my function:

pollutantmean("specdata", "sulfate", 1:10)
#4.06
pollutantmean("specdata", "nitrate", 70:72)
#1.70
pollutantmean("specdata", "nitrate", 23)
#1.28

#All Correct ! 

###########################