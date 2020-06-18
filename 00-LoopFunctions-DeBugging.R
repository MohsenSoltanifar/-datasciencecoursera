#################################################################


x <- list(a = 1:5, b = rnorm(10))
y<-lapply(x, mean)
y[[1]]
y[[2]]


####

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
y<-lapply(x, mean)

for(i in 1:4){
  print(y[[i]])
}

####

x <- 1:4
z<-lapply(x, runif)


for(i in 1:4){
  print(z[[i]])
}

####

x <- 1:4
w<-lapply(x, runif, min = 0, max = 10)
for(i in 1:4){
  print(w[[i]])
}

####


x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
v<-lapply(x, function(elt) elt[,1])
for(i in 1:2){
   print(v[[i]])
}

####

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
y<-lapply(x, mean)
for(i in 1:4){
  print(y[[i]])
}

z<-sapply(x, mean)
print(z)
for(i in 1:4){
  print(z[i])
}

#################################################################

x <- matrix(rnorm(200), 20, 10)
print(x)
y<-apply(x, 2, mean) # second dimension: columns
print(y)
z<-apply(x, 1, mean) # first dimesnion:  rows
print(z)
w<-apply(x, 1, quantile, probs = c(0.25, 0.75)) #first dimesnion: rows- Q1, Q3 !
print(w)

S <- array(rnorm(2 * 2 * 10), c(2, 2, 10)) # three dimensional array: 10 of 2*2 matrices
T<-apply(S, c(1, 2), mean) # mean of each of 10 matrices inside three dimesnional array
print(T)

#################################################################

x<-list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1)) # rep: repeat !  
print(x)
y<- mapply(rep, 1:4, 4:1)
print(y)

####

noise <- function(n, mean, sd) {
rnorm(n, mean, sd)
}
noise(5, 1, 2)
noise(1:5, 1:5, 2)
z1<-mapply(noise, 1:5, 1:5, 2)
print(z1)

z2<-list(noise(1, 1, 2), noise(2, 2, 2),
         noise(3, 3, 2), noise(4, 4, 2),
         noise(5, 5, 2))
print(z2)

# Note:   z1 and z2 are the same !

#################################################################


x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10): #three levels each repated 10 times. which group the observation belogns to !
f

y<- tapply(x, f, mean)
print(y)

z<-tapply(x, f, mean, simplify = FALSE)
print(z)

w<-tapply(x, f, range) # Finds group ranges: min-max !
print(w)

w<-tapply(x, f, range, simplify = TRUE)
print(w)



#################################################################

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)

lapply(split(x, f), mean)

####

library(datasets)
head(airquality)
summary(airquality$Month)
s <- split(airquality, airquality$Month)
s
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
# this gives a matrix
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
# remove the missing values
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")],na.rm = TRUE))

####

#Higher levels

x <- rnorm(10)
f1 <- gl(2, 5) # two levels each repeated five times
f2 <- gl(5, 2) # five levels each repeated two times
f1f2<-interaction(f1,f2) # 10=2*5 levels 
f1
f2
f1f2
# Two equavalent ways
# with some empty levels !
str(split(x, list(f1, f2))) 
str(split(x, f1f2))
# without empty levels:
str(split(x, list(f1, f2), drop = TRUE)) 
str(split(x, f1f2, drop = TRUE))

#################################################################

log(-1)


printmessage <- function(x) {
  if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  invisible(x) # No autoprinting of the object in the console !
}

printmessage <- function(x) {
  if (x > 0)
    print("x is greater than zero") else print("x is less than or equal to zero")
  invisible(x)
}
printmessage(1)

printmessage(NA)

printmessage2 <- function(x) {
  if(is.na(x))
    print("x is a missing value!")
  else if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  invisible(x)
}

printmessage2 <- function(x) {
  if (is.na(x))
    print("x is a missing value!") else if (x > 0)
      print("x is greater than zero") else print("x is less than or equal to zero")
  invisible(x)
}
x <- log(-1)
printmessage(x)
printmessage2(x)

#################################################################

mean(x)
traceback()

lm(y ~ x)
traceback()

debug(lm)

lm(y ~ x)


options(error = recover)
read.csv("nosuchfile")







#################################################################










