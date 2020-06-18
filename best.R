
setwd("C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week4/Assignment3")
#preparing the data from the source data !

mydata0<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(mydata0)
str(mydata0)

mydata1<-  mydata0[,c(2,7,11,17,23)]
head(mydata1)
str(mydata1)

names(mydata1)[1] <- "hospital"
names(mydata1)[2] <- "state"
names(mydata1)[3] <- "heart attack"
names(mydata1)[4] <- "heart failure"
names(mydata1)[5] <- "pneumonia"

mydata2<- mydata1
head(mydata2)
str(mydata2)

mydata2[, c(3:5)] <- sapply(mydata2[, c(3:5)], as.numeric)
mydata3<- mydata2

head(mydata3)
str(mydata3)


write.csv(mydata3,'mydata3.csv')
mydata3<-read.csv("mydata3.csv")
mydata3$heart.attack[is.na(mydata3$heart.attack)] <- 10000
mydata3$heart.failure[is.na(mydata3$heart.failure)] <- 10000
mydata3$pneumonia[is.na(mydata3$pneumonia)] <- 10000
mydata4<-mydata3

write.csv(mydata4,'mydata4.csv')

head(mydata4)
str(mydata4)


####################################################################


best <- function(state, outcome) {
  mydata<-read.csv("mydata4.csv")
  mystatedata<-mydata[which(mydata$state==state),]
  if(outcome=='heart.attack'){mystatedatao<- mystatedata[with(mystatedata, order(heart.attack, desc(hospital))), ] }
  if(outcome=='heart.failure'){mystatedatao<- mystatedata[with(mystatedata, order(heart.failure, desc(hospital))), ]}
  if(outcome=='pneumonia'){mystatedatao<- mystatedata[with(mystatedata, order(pneumonia, desc(hospital))), ] }
  mystatedatao$hospital[1]
}




###################################################################
#test

best("TX", "heart.attack")
#[1] "CYPRESS FAIRBANKS MEDICAL CENTER"


best("TX", "heart.failure")
#[1] "FORT DUNCAN MEDICAL CENTER"

best("MD", "heart.attack")
#[1] "JOHNS HOPKINS HOSPITAL, THE"

best("MD", "pneumonia")
#[1] "GREATER BALTIMORE MEDICAL CENTER"

###################################################################

best("SC", "heart.attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
 
