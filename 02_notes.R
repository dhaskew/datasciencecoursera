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

# partial matching
x <- list(ardvark = 1:5)
x
# fuzzy match on name with "a"
# ardvark is only element (vector), so this returns that vector
x$a
# double bracket doest work with fuzzy matching
x[["a"]]
# ensure fuzzy matching is on
x[["a", exact = FALSE]]

#removing NA values
x <- c(1,2,NA,4,NA,5)
# identify which are NA
bad <- is.na(x)
bad
# colect only FALSE items
x[!bad]

x <- c(1,2,NA,4,NA,5)
y <- c("a","b",NA,"d",NA, NA)

# get a boolean list of which positions are NA in either vector x or y
good <- complete.cases(x,y)
good

x[good]
y[good]

#print first 6 rows of built-in sample dataframe
airquality[1:6, ]

# get booleans for rows.  true if no NA values
good <- complete.cases(airquality)
good
# print first 6 good rows
airquality[good,][1:6,]

# vectorized operations
x <- 1:4
y <- 6:9
x
y
# add each element of x to the corresponding element of y
# works with * / - .... etc
x + y

# matrix operations
x <- matrix(1:4,2,2)
y <- matrix(rep(10,4),2,2)
x
y

# multiply the matrix elements
x * y

x / y

# true matrix multiplication
x
y
x %*% y

############
#  Week 2 Starts Here
############
x <- 0
y <- 1
z <- 2
# if statements
if(x > 0)
{
  x
} else if(x > 1) {
  y
} else { z }

# for loops
for(i in 1:10)
{
  print(i)
}

x <- c("a", "b", "c", "d")

for(i in 1:4) { print(x[i]) }

for(i in seq_along(x)) print(x[i])

for(letter in x) print(letter)

x <- matrix(1:6, 2 , 3)

for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i,j])
  }
}

# while loop
count <- 0
while(count < 10)
{
  print(count)
  count <- count + 1
}


# # repeat loop
# x0 <- 1
# tol <- 1e-8
# 
# repeat {
#   x1 <- computeEstimate()
#   
#   if(abs(x1-x0) < tol)
#   {
#     break
#   } else {
#     x0 <- x1
#   }
# }

# next , return
# next is used to skip an iteration

for(i in 1:20)
{
  if(i <= 10) { next } 
  print(i)
}

# writing functions - introduction
add2 <- function(x,y)
{
  x + y # no explicit return required
}

add2(1,3)

above <- function(x,y=10) #notice default argument value
{
  use <- x > y
  x[use]
}

x <- c(10,11,5)
above(x,9)
above(x) # called with default value for y

# calculate the means of the columns in airquality dataframe
columnmean <- function(y, removeNA=TRUE)
{
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}

columnmean(airquality, FALSE)

# ... argument passes thru arguments or allows for generic functions
# suppose you want to extend the plot function
# and change the default type
myplot <- function(x,y,type="1", ...){
  plot(x,y,type=type, ...)
}

# any arguments after the ... argument must be name arguments
myplot <- function(..., test=1, arg2=2)
{
  x
}

# review your environment
search() # shows global environment and packages
# order on search list is important - global env is always first
# determines where R looks for functions when you call them

# R uses lexical scoping

# Free Variables are not function args or local variables
# Below: z is a free variable -- its defined elsewhere
test <- function(x,y)
{
  (x+y)/z
}

# a function + environment = closure
# R can define functions inside other functions

make.power <- function(n)
{
  pow <- function(x){
    x^n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)

cube(3)
square(3)

#In R, the calling environment is called the parent frame

# optimization routines
# optim, nlm, optimize

#identify and show items in an environment
search()
ls(.GlobalEnv)

# coding standards - recommendations
# save code as text - via text editor
# indent your code at least 4 spaces - 80 chars max width
# logical, small functions

# dates and times in R
# date stored as number of days since 1970-01-01 (epoch)
# time stored as number of seconds since epoch

x <- as.Date("1970-01-01")
x
unclass(x)
x
unclass(as.Date("1970-01-02"))
unclass(as.Date("1970-01-03"))
unclass(as.Date("1969-12-25"))

x <- Sys.time()
x
p <- as.POSIXlt(x)
p$min
names(unclass(p))
p <- as.POSIXct(x)
p
names(unclass(p))

datestring <- c("January 10, 2012 10:40", "Decemeber 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)
# ?strptime for format codes

x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x-y

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz="GMT")
z <- y-x
z

# week 3 notes start here
# fancy loop functions
# lapply, sapply, apply, tapply, mapply
# split is also helpful with the above

# lapply example(s)
x <- list( a=1:5, b = rnorm(10) )
lapply( x, mean)

# lapply - pass args when called
# min and max are ars to runif
x <- 1:4
lapply(x, runif, min = 0, max = 10)

x <- list( a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 3))
x
# if we want to extract a first column of the matrices
# we can use a custom add-hoc Anonymous function

# we loop thru our list of matrices and extract the first column of each
# using a custom fuction
lapply(x, function(elt) elt[,1])

# sapply is a variant of lapply
# it tries to simply the output type that lapply would return
# example: if lapply would ruturn a list of ints
#          then sapply would convert that to a vector

# apply function
# similar in spead to a for loop, but it has a one-liner syntax
# used to work on arrays/matrices

x <- matrix(rnorm(200), 20, 10) #20 rows , 10 columns
x
# if we wanted to get the mean of every column
apply(x,2,mean)

# if we want to sum each row, 1 = preserve rows, collapse columns
apply(x,1,sum)

# these types of operations are very common
# you should really be using the existing functions, instead of apply
# rowSums, rowMeans, colSums, colMeans

# example: for every row, find the 25th / 75th percentile for the distribution
# We get a 2 rows by 20 col matrix 
x <- matrix(rnorm(200), 20, 10) # 20 rows, 10 columns, 200 normally dist items
y <- apply(x,1, quantile, probs=c(0.25, 0.75))
y
class(y)

# array(multidimentional) example
a <- array(rnorm(2 * 2 * 10), c(2,2,10))
a
apply(a, c(1,2), mean)
# same as
rowMeans(a, dims = 2)

# mapply -> applies a function in parallel over a set of arguments
str(mapply) # describe params

list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
# or
mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}

# simple function call example
noise(5,1,2)

# which would you rather use
mapply(noise, 1:5, 1:5, 2)
# vs 
list(noise(1,1,2), noise(2,2,2),
     noise(3,3,2), noise(4,4,2),
     noise(5,5,2))

# tapply - used to apply function over subsets of a vector
str(tapply)

# example
x <- c(rnorm(10), runif(10), rnorm(10,1))
x
class(x) # numeric vector
str(gl)
f <- gl(3,10) # generate a vector of 3 levels, each contained 10 times out
              # of the thirty (3*10) generated
f

y <- tapply(x,f,mean) # now we generate the mean for each of the levels
                      # every position in x that corresponds to '1' in gl is
                      # subsetted and the mean is taken, same for 2 and 3
                      # you get back 3 means, 1 or each subset
y
class(y)

# split the factor variable into the 3 groups defined by x below
str(split)
x <- c(rnorm(10), runif(10), rnorm(10,1))
x
f <-gl(3,10)
f
split(x,f)

# get the mean of those 3 groups -- using split and lapply
lapply(split(x,f),mean)

#library(datasets)
head(airquality)

# calculate the mean of the measures by month

# split the airquality data.frame by month
s <- split(airquality, airquality$Month)
s
# we get a list back
class(s)
# use lapply to calculate means of each item in our list
# we use an anonymous function that calls colMeans
lapply(s, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")]))
# sapply may give us better output
# remember - sapply symplifies the output -- which is ofter good!
y <- sapply(s,function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")]))
class(y) # we get a matrix from sapply, instead of the list from lapply
y # the matrix displays better
# solve the NA problem
y <- sapply(s,function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")], na.rm=TRUE))
y

# spliting up more than one level - example

# generate 10 normally distributed numbers
x <- rnorm(10) 
x
f1 <- gl(2,5)
f1
f2 <- gl(5,2)
f2

# combine those two (f1,f2) factors into a combined factor
# we get a 3rd factor, where f2 is the decimal place of f1 in the new factor 
z <- interaction(f1,f2)
class(z)
z

p <- split(x,list(f1,f2))
class(p)
p
str(p)

#### Debugging #####

# common tools - traceback, debug, browser, trace, and recover

# invisible function - probably needs  some research
printmessage <- function(x){
  print("foobar")
  x <- 1
  invisible(x)
}

y <- printmessage(1)
printmessage(1) # only prints "foobar", since the return 'x' is invisible
y # still equals the result. all that was affected was printing

printmessage <- function(x){
  print("foobar 2")
  x <- 2
  return(x)
}

y <- printmessage(1)
printmessage(1)  # this prints "foobar 2 and 2 to the screen"
y

# traceback - get most recent error
#mean(BogusVariableName)
# traceback() # works from console, not in script

# debug(printmessage) # will start debugging for that function call on next execute
# printmessage(2)

# option(error = recover)
# gives you a recovery menu

# messages, warnings, and errors are common output from R
# only errors are fatal


#quiz three stuff
library(datasets)
data(iris)
iris
class(iris)

# question 1
iris$Sepal.Length
vss <- subset(iris, Species=="virginica")
mean(vss$Sepal.Length)

# question 2
apply(iris[, 1:4], 2, mean)

# question 3
data(mtcars)
mtcars

tapply(mtcars$mpg, mtcars$cyl, mean)

# question 4
ta <- tapply(mtcars$hp, mtcars$cyl, mean)
ta
class(ta)
q4 <- ta["8"] - ta["4"]
q4


# week 4 starts here
# str - function to look at an object - "most useful funciton in all of R"
# summary - function to summarize
# head - view first few rows
str(q4)

x <- rnorm(100,2,4)
summary(x)
str(x)

# similation
# functions: rnorm, dnorm, pnorm, rpois

# d for density
# r for random number generation
# p for cumulative
# q for quantile

#dnorm(x, mean=0, sd=1, log = FALSE)
#pnorm(q, mean=0, sd=1, lower.tail=TRUE, log.p=FALSE)
#qnorm(p, mean=0, sd=1, lower.tail=TRUE, log.p=FALSE)
#rnorm(n, mean=0, sd=1)

x <- rnorm(10) #10 normal random variables
x
# setting the seed is important for reproducable results
# it makes random numbers ... not random. psuedo random
set.seed(1)
rnorm(5)

rpois(10,1)

rpois(10,20)

ppois(2,2) # p means cumulative distribution - see legend above

# generating random numbers from a linear model
set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x,y)

# what if x is binary?
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100,0,2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x,y)

# poisson example
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x,y)

# random sampling
set.seed(1)
sample(1:10,4)
sample(1:10,4)
sample(letters,5)
sample(1:10)
sample(1:10)
sample(1:10, replace=TRUE)

# profiling
system.time(summary(y))
# or
# Rprof()
# summaryRprof()
# by.total
# by.self
# sample.interval
# sampling.time

