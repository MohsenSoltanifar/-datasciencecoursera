#Setting Working directory

setwd("C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week2/Assignment1/rprog_data_specdata/specdata")

#Create directory named "specdata" !

dir.create("C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week2/Assignment1/rprog_data_specdata/specdata", showWarnings = TRUE, recursive = FALSE)

## This is my function. 
##########################

complete <- function(directory, id=1:332){
  
  directory <- "C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week2/Assignment1/rprog_data_specdata/specdata"
  
  id2<-c()
  nobs2<-c()
  mydata <- data.frame()
  files <- list.files(directory, full.names = TRUE)
  for(i in id) {
    mydata <-  read.csv(files[i]) 
    mydata2<-mydata[complete.cases(mydata), ]
    nobs2[i]<-nrow(mydata2)
    id2[i]<-i
  } 
  Answer1<- cbind(id2,nobs2) 
  Answer<- as.data.frame(Answer1[complete.cases(Answer1),])
  Answer
  
}
###########################
 
##Testing my function:

source("complete.R")
complete("specdata", 1)

# 1, 117

complete("specdata", c(2, 4, 8, 10, 12))

#id2 nobs2
#1   2  1041
#2   4   474
#3   8   192
#4  10   148
#5  12    96

complete("specdata", 30:25)
#id2 nobs2
#1  25   463
#2  26   586
#3  27   338
#4  28   475
#5  29   711
#6  30   932

complete("specdata", 3)
#id2                                    3
#nobs2                                243
