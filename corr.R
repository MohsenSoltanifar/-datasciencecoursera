#Setting Working directory

setwd("C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week2/Assignment1/rprog_data_specdata/specdata")

#Create directory named "specdata" !

dir.create("C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week2/Assignment1/rprog_data_specdata/specdata", showWarnings = TRUE, recursive = FALSE)

## This is my function. 
##########################


corr<- function(directory, threshold){
  
  directory <- "C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week2/Assignment1/rprog_data_specdata/specdata"
  
  id2<-c()
  nobs2<-c()
  corr2<-c()
  mydata <- data.frame()
  files <- list.files(directory, full.names = TRUE)
  for(i in 1:332) {
    mydata <-  read.csv(files[i]) 
    mydata2<-mydata[complete.cases(mydata), ]
    nobs2[i]<-nrow(mydata2)
    id2[i]<-i
    corr2[i]<-cor(x=mydata2$sulfate,y=mydata2$nitrate)
  } 
  Answer2<- cbind(id2,nobs2,corr2) 
  Answer1<- as.data.frame(Answer2[complete.cases(Answer2),])
  Answer<-Answer1[Answer1$nobs2>=threshold,]
  Answer
}

###########################

##Testing my function:

cr <- corr("specdata", 150)
head(cr)

#id2 nobs2       corr2
#2   2  1041 -0.01895754
#3   3   243 -0.14051254
#4   4   474 -0.04389737
#5   5   402 -0.06815956
#6   6   228 -0.12350667
#7   7   442 -0.07588814

cr <- corr("specdata", 400)
head(cr)

#id2 nobs2       corr2
#2    2  1041 -0.01895754
#4    4   474 -0.04389737
#5    5   402 -0.06815956
#7    7   442 -0.07588814
#11  11   443  0.76312884
#17  17   927 -0.15782860


cr <- corr("specdata", 5000)
summary(cr)
length()
