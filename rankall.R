setwd("C:/Users/Mohsen/Desktop/Data.Science.Certificate.Coursera2020/Course 2. R Programming/Week4/Assignment3")


head(mydata4)
str(mydata4)


####################################################################

library(dplyr)


rankall<- function(outcome, number){
  mydata<-read.csv("mydata4.csv")
  stateindex<- sort(unique(mydata$state))  
  A<- matrix(rep(NA), nrow = 54, ncol = 3)
  colnames(A)=  c( "State","Rank", "Worst" )
  
for(i in 1:54){
  mystatedata<-mydata[which(mydata$state==stateindex[i]),]
  
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
  
  A[i,]<-c(stateindex[i], mystatedata4$hospital[number], mystatedata4$hospital[worst])
  

}  
  
A 


}

############################################################

##test

head(rankall("heart.attack", 20), 10)

#State Rank                                  Worst                             
#[1,] "AK"  NA                                    "MAT-SU REGIONAL MEDICAL CENTER"  
#[2,] "AL"  "D W MCMILLAN MEMORIAL HOSPITAL"      "HELEN KELLER MEMORIAL HOSPITAL"  
#[3,] "AR"  "ARKANSAS METHODIST MEDICAL CENTER"   "MEDICAL CENTER SOUTH ARKANSAS"   
#[4,] "AZ"  "JOHN C LINCOLN DEER VALLEY HOSPITAL" "VERDE VALLEY MEDICAL CENTER"     
#[5,] "CA"  "SHERMAN OAKS HOSPITAL"               "METHODIST HOSPITAL OF SACRAMENTO"
#[6,] "CO"  "SKY RIDGE MEDICAL CENTER"            "NORTH SUBURBAN MEDICAL CENTER"   
#[7,] "CT"  "MIDSTATE MEDICAL CENTER"             "JOHNSON MEMORIAL HOSPITAL"       
#[8,] "DC"  NA                                    "HOWARD UNIVERSITY HOSPITAL"      
#[9,] "DE"  NA                                    "ST FRANCIS HEALTHCARE"           
#[10,] "FL"  "SOUTH FLORIDA BAPTIST HOSPITAL"      "PALMETTO GENERAL HOSPITAL"

#tail(rankall("pneumonia", "worst"), 3)
tail(rankall("pneumonia", 1), 3)

#State Rank                         Worst                                       
#[52,] "WI"  "BELLIN MEMORIAL HSPTL"      "MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC"
#[53,] "WV"  "WEIRTON MEDICAL CENTER"     "PLATEAU MEDICAL CENTER"                    
#[54,] "WY"  "CHEYENNE VA MEDICAL CENTER" "NORTH BIG HORN HOSPITAL DISTRICT"

tail(rankall("heart.failure",1), 10)
#State Rank                                                               
#[45,] "TN"  "WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL"                        
#[46,] "TX"  "FORT DUNCAN MEDICAL CENTER"                                       
#[47,] "UT"  "VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER"
#[48,] "VA"  "SENTARA POTOMAC HOSPITAL"                                         
#[49,] "VI"  "GOV JUAN F LUIS HOSPITAL & MEDICAL CTR"                           
#[50,] "VT"  "SPRINGFIELD HOSPITAL"                                             
#[51,] "WA"  "HARBORVIEW MEDICAL CENTER"                                        
#[52,] "WI"  "AURORA ST LUKES MEDICAL CENTER"                                   
#[53,] "WV"  "FAIRMONT GENERAL HOSPITAL"                                        
#[54,] "WY"  "CHEYENNE VA MEDICAL CENTER" 

#################################################################

r <- rankall("heart.attack", 4)
#as.character(subset(r, state == "HI")$hospital)
r[13,]

r <- rankall("pneumonia", "worst")
#as.character(subset(r, state == "NJ")$hospital)
r[33,]

r <- rankall("heart.failure", 10)
#as.character(subset(r, state == "NV")$hospital)
r[35,]
