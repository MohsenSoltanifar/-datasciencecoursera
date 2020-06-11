add2<- function(x,y){x+y}
add2(3,60)
################################

above10 <- function(x)
{
case <- x>10
x[case]
}

x<- 3:45

above10(x)
################################
above<- function(x,n)
{
case<- x>n
x[case]
}

x<- 3:45

above(x,30)
################################
columnmean <- function(y)
{
nc<- ncol(y)
means<-numeric(nc)
for(i in 1:nc)
{
means[i]<- mean(y[,i])  
}
means  
}

head(cars)
columnmean(cars)

#################################

columnmean2 <- function(y,removeNA=TRUE)
{
  nc<- ncol(y)
  means<-numeric(nc)
  for(i in 1:nc)
  {
    means[i]<- mean(y[,i],na.rm=removeNA)  
  }
  means  
}

head(airquality)

columnmean(airquality)

columnmean2(airquality)

##################################

