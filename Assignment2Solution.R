#Write the following functions:
  
#makeCacheMatrix: This function creates a special "matrix"
#object that can cache its inverse.



makeCacheMatrix <- function(x = matrix()) {
  d <- NULL
  set <- function(y) {
    x <<- y
    d <<- NULL
  }
  get <- function() x
  setdet <- function(det) d <<- det
  getdet <- function() d
  list(set = set, get = get,
       setdet = setdet,
       getdet = getdet)
}



#cacheSolve: This function computes the inverse of the special "matrix" 
#returned by makeCacheMatrix above. If the inverse has already been calculated
#(and the matrix has not changed),
#then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  d <- x$getdet()
  if(!is.null(d)) {
    message("getting cached determinant")
    return(d)
  }
  matrixdata <- x$get()
  d <- solve(matrixdata, ...)
  x$setdet(d)
  d
}

##################################################################################


#My peers Solutions:

#1:

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y) {
    
    x <<- y
    inv <<- NULL
    
  }
  get <- function() x
  setInverso <- function(inverso) inv <<- inverso
  getInverso <- function() inv
  list(set = set, get = get,
       setInverso = setInverso,
       getInverso = getInverso)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverso()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverso(inv)
  inv
}

#2

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" created by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then it should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}

#3

makecachematrix=function(x=matrix){
  inv=NULL
  set=function(y){
    x<<-y
    inv<<-NULL
  }
  get=function()x
  setInverse=function(inverse)inv<<-inverse
  getInverse=function()inv
  list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
}

cachesolve=function(x,...){
  inv=x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  mat=x$get()
  inv=solve(mat,...)
  x$setInverse(inv)
  inv
}





