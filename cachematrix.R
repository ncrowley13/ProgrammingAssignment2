## Put comments here that give an overall description of what your
## functions do

## this main function stores a list of subset functions
## that act on an input matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<-y
    m <<-NULL
  }
  get <-function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function () m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## This function calculates the inverse of a matrix
##or calls it from the cache

cacheSolve <- function(x=solve(), ...) {
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  solve<-x$get()
  m<-solve(solve, ...)
  x$setinverse(m)
  m
}

