##Function description
## The functions will assign a value to an object
##in an environment that is different from the current environment. 
##This takes advantage of the scoping rules to cache the output of a computation
## so that in repeat computations the cache is accessed removing the need to compute
##the results each time the original output is required.
## note A test matrix is included to demonstrate the functions.


##Function description
##inv <- NULL sets the inverse to NULL as a placeholder
##set <- function(y) {x <<- y; inv <<- NULL} defines a function to set the vector,
##x, to a new vector, y, and resets the inverse, inv, to NULL.
##The get <- function() x returns the vector, x
##The setinverse <- function(inverse) {inv <<- inverse}, sets the function inv <- inverse
##The getinverse <- function() inv returns the inverse
##The list(set = set, get = get,setinverse = setinverse,getinverse = getinverse) 
##returns the "functions"special vector


makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <-  function(y){
        x <<- y
        inv <<- NULL
        
        }
        get <- function()  {x}
        setInverse <- function(inverse) {inv <<- inverse}
        getInverse <- function() {inv}
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}



## function description
##cachemean <- function(x, ...) {
...
##The cacheSolve() has a single argument, x, and an ellipsis ... to pass additional arguments. 
##The function () retrieves and  calls the getInverse() 
##It checks to see whether the result is NULL. If not NULL, a valid, cached mean is returned.
## The message("getting cached data") is returned when the function is using the 
##cache results of the first function


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        if(!is.null(inv)){
           message("getting cache data")
           return(inv)
        }   

mat <-x$get()
inv <- solve(mat,...)
x$setInverse(inv)
inv
}  

#test to show results 
#set up a matrix that can be inverted
data1 <- c(1,0,4)
data2 <- c(1,3,4)
data3 <- c(4,1,0)
##create the matrix
A <- rbind(data1,data2,data3)             

#test for A
testmatrix <- makeCacheMatrix(A)
testmatrix$get()
testmatrix$getInverse()
#run this line twice to show message getting cache data
cacheSolve(testmatrix)
cacheSolve(testmatrix)
             