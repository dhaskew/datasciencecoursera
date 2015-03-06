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

# matrices - special type of vector - not a seperate type
# multidimentional array?

m <- matrix(nrow = 2, ncol = 3)
m

# if you have a vector ... say created from a sequence
v <- 1:10
v
# convert that to matrix of 2 rows and 5 columns
# use dim() function to set dimentions
dim(v) <- c(2,5)
v

# combine multiple vectors into a matrix
# cbind = column bind, rbind = row bind

x <- 1:5
y <- 101:105

cbind(x,y)

rbind(x,y)

# factors - ordered or unordered - represent catagorical data
# Male vs Female for example
x <- factor(c("yes","no","yes","yes"))
x

# get a table representation of the factor - with totals
table(x)

# see how R stores the underlying factor(s) in the factor
# yes = 2, no = 1
unclass(x)

# if you want to control the order of the elements of a factor
# use the levels option
# otherwise, the first level/element is the baseline

x <- factor(c("yes","no","yes","yes"), levels=c("yes","no"))
x

# now when we call unclass(x), yes = 1, no = 2
unclass(x)

# missing values na and nan
# you can test for them
x <- c(1,2, NA, 10,3)
is.na(x)
is.nan(x)

# notice NaN is also NA, but the reverse isn't true
x <- c(1,2,NaN, NA, 4)
is.na(x)
is.nan(x)

# data frames - tabular data
# can store objects of different types
# row.names attributes
# usually created with read.table() or read.csv()
x <- data.frame(foo=1:4,bar=c(T,T,F,F))
x

# get number of rows of data frame
nrow(x)

# get number of cols of data frame
ncol(x)

# R objects can also have names, but different types implement differently
names(x)

# list example
x <- list(a=1,b=2,c=3)
x
names(x)

# matrix example
m <- matrix(1:4, nrow=2, ncol=2)
dimnames(m) <- list(c("a","b"), c("c","d"))
m


# how much memory to store data frame in memory?
# assume 1,500,000 rows and 120 columns .. all numeric data
# 1.5 mil * 120 columns * 8 bytes/numeric # assume 64 bit
# 1440000000 bytes / 2^20 bytes/MB
# 1,373.29 MB
# 1.34 GB


# textual data formats - useful for storing in git or doing diffs
y <- data.frame(a = 1, b = "a")
y
dput(y)

# dput(y, file= "y.R")
# new.y <- deget("y.R")
# new.y

# dget vs dump
# dump can be used on multiple objects at once
x <- "foo"
y <- data.frame(a=1,b="a")
# dump(c("x","y"), file="data.R")

# remove objects from memory in current environment
rm(x,y)

# read in the data.R file
# source("data.R")

# file , gzfile, gzfile, and url() are all useful data reading functions
# read.csv and similar use it behind the scenes
# often useful when you don't want to read the whole file

# example - readlines
con <- file('~/.bashrc')

# read first 2 lines
x <- readLines(con,2)
x
# close the connection
close(con)

# single bracket '[' always returns a subset of same class
# double bracket '[[' returns a single element from list/dataframe - object return may not be the same type

# subsetting vectors

x <- c("10","11","12")
# numerical index access
x[1]
x[2:3]
x[x>11]
x[x<=11]
# logical index access
u <- x >= 11
u
x[u]

# subsetting a list
x <- list(foo=1:4, bar = 0.6)
# get single element
x[1]
x[[1]]
x$bar
x["bar"]
x[["bar"]]
# get multiple elements
x[c(1,2)]

# get nested items
x <- list(a = list(10,12,14), b=c(3.14,2.18))

# same result - get 14
x[[c(1,3)]]
x[[1]][[3]]

# get 3.14
x[[c(2,1)]]

# subset a matrix
x <- matrix(1:6,2,3)
x

x[1,2] # row one, column 2  as a vector
x[2,1] # row two, colunn 1  as a vector

x[1,] # whole first row as a vector
x[,2] # whole second column vector

# use drop=FALSE to ensure you get a matrix back, instead of say .. a vector
x[1,2, drop = FALSE]


