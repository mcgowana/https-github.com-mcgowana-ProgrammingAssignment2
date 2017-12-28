## The makeCacheMatrix and cacheSolve functions work together to cache the 
## inverse of a matrix. Caching the inverse of the matrix allows the user to 
## not have to compute the inverse of the matrix multiple times.

## The makeCacheMatrix function caches the matrix. In this function, a type
## of matrix is inputted. Then, the matrix is set to itself, and the inverse
## of the matrix is manually set. Then the function gets both the original 
## and inverse matrices.

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL

	set <- function(a) {
		x <<- a
		inv <<- NULL
	}

	get <- function() x

	makeInverse <- fucntion(inverse) inv <<- inverse

	setInverse <- function() inv

	list(set = set, get = get, makeInverse = makeInverse, setInverse = setInverse)

}


## The cacheSolve function then computes the inverse of the matrix and caches
## the result. First, the function gets the current inverse to find out if 
## it has been computed. If it has, the same matrix is returned. If it has
## not, the inverse is found, and the result is cached and returned.

cacheSolve <- function(x, ...) {
	inv <- x$getInverse()
	
	if(!is.null(inv)) {
		message("getting cached data")
		return(inv)
	}

	mat <- x$get()
	inv <- solve(mat, ...)
	x$setInverse(inv)
	inv
}
