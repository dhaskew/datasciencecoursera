# comments are like this

# r version string
R.version.string

# variable assignment
x <- 10

# variable assignment - sequence
x <- 1:20

# print a variable
x

# get the type of a variable
typeof(x)

# multiply a sequence
y <- x * 2

# print the new sequence
y

# list objects in workspace
ls()

# a vector is similar to c# array - must all be same object type, else coercion
# is performed automatically by R - behavior can be interesting



# create a vector explicitly using c() or vector()
x <- c(0.5,0.6) ## numeric vector
x <- c(TRUE,FALSE) ## logical vector
x <- c(T,F) ## logical
x <- c('a','b','c') ## character
x <- c(1+0i, 2+4i) ## complex
x <- vector("numeric", length = 10) # vector of 10 zeros
x

# numbers vs integers
i <- 10L  # integers require 'L'
j <- 10   # numbers/doubles are more general

# determine types or classes of something
typeof(i)
typeof(j)

class(i)
class(j)

var1 <- TRUE
var2 <- 10
var3 <- 1

# manual conversion of data types
as.numeric(var1) # true converts to 1, false 0
as.complex(var2)
as.logical(var3)

# a list is like a vector, but can contain different types
x <- list(1,"a",TRUE,1+4i)

# lists are indexed starting at 1
# reference the 2nd item - "a"
x[[2]]

