setwd("C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week4/Assignment3")


head(mydata4)
str(mydata4)


####################################################################

library(dplyr)

rankhospital <- function(state, outcome, number ) {
  mydata<-read.csv("mydata4.csv")
  
  
  mystatedata<-mydata[which(mydata$state==state),]
  
  if(outcome=='heart.attack'){mystatedata2<- mystatedata[with(mystatedata, order(heart.attack,  hospital )), ] 
  mystatedata3<-   mutate(mystatedata2, rank=rank(heart.attack, ties.method= "first"))
  mystatedata4<-mystatedata3[which(mystatedata3$heart.attack<999),]}
  
  if(outcome=='heart.failure'){mystatedata2<- mystatedata[with(mystatedata, order(heart.failure,  hospital )), ] 
  mystatedata3<-   mutate(mystatedata2, rank=rank(heart.failure, ties.method= "first"))
  mystatedata4<-mystatedata3[which(mystatedata3$heart.failure<999),]}
  
  if(outcome=='pneumonia'){mystatedata2<- mystatedata[with(mystatedata, order(pneumonia,  hospital )), ] 
  mystatedata3<-   mutate(mystatedata2, rank=rank(pneumonia, ties.method= "first"))
  mystatedata4<-mystatedata3[which(mystatedata3$pneumonia<999),]}
  
  
  worst=nrow(mystatedata4)
  
  A=matrix(c(mystatedata4$hospital[number], mystatedata4$hospital[worst]), nrow = 2, ncol = 1)
  dimnames(A) = list( c("Rank", "Worst" ),c("Answer"))  
  A
}

#####################################################################

#test



rankhospital("TX", "heart.failure", 4)
#      Answer                  
#Rank  "DETAR HOSPITAL NAVARRO"
#Worst "ETMC CARTHAGE" 

rankhospital("MD", "heart.attack", 1)
#Answer                       
#Rank  "JOHNS HOPKINS HOSPITAL, THE"
#Worst "HARFORD MEMORIAL HOSPITAL"

######################################################################

rankhospital("NC", "heart.attack", 1)#read worst
rankhospital("WA", "heart.attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart.attack", 7)
