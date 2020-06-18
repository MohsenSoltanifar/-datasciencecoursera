## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#This function creates a special "matrix"
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



## Write a short comment describing this function
#This function computes the inverse of the special "matrix" 
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


##############################################


#46c4ae0900df7bea5a884aea920a6b8baf02fbbc

##############################################


