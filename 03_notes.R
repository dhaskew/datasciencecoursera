# Notes: 03 - Getting and Cleaning Data

######## Week 1 #########

# getwd / setwd
# file.exists("directoryName")
# dir.create("directoryName")
# download.file("url.com", destfile="filepath.csv", method="curl")
# list.files("filePath.csv")

# read.table()
# read.csv()
# read.csv2()

# read.table("./filename", sep=",", header=TRUE)

# xlsx package
# colIndex <- 2:3
# rowIndex <- 1:4
# read only the 2nd and 3rd columns in from rows 1 thru 4
# read.xlsx("./filename.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
# write.xlss
# read.xlsx2 is faster but more unstable thate read.xlsx

# reading xml
# library(xml)
# doc <- xmlTreeParse("./filenameOrUrl", useInternal=TRUE)
# rootNode <- xmlRoot(doc)
# xmlName(rootNode)
# names(rootNode)
# rootNode[[1]] # access 1st root element
# rootNode[[1]][[1]] # access 1st subcomponent of the 1st root element
# xmlSApply(rootNode, xmlValue)

# XPath
# xpathSApply(rootNode, "//name", xmlValue) # get xmlValue part of "name" nodes

# parse the HTML dom of a webpage or html file
# find all items on page of type list item (li) with class "score"
# htmlTreeParse("./filenameOrURL", "//li[@class='score']", xmlValue)

# reading JSON
#library(jsonlite)
# jsonData <- fromJSON("https://api.github.com/users/dhaskew/repos")
# names(jsonData)
# names(jsonData$owner)
# jsonData$owner$login
# myjson <- toJSON(iris, pretty=TRUE) # dataframe to JSON
# cat(myjson) # look at JSON
# iris2 <- fromJSON(myjson) # get dataframe from JSON
# head(iris2)
# head(iris)
# 
# # data.table
# # inherits from data.frame.
# # its faster
# library(data.table)
# DF = data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
# head(DF,3)
# 
# DT = data.table(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
# head(DT,3)
# 
# # list data tables
# tables()
# 
# # subset a data table
# DT[,c(2,3)]
# 
# # apply functions to values
# DT[,list(mean(x), sum(z))]
# DT[,table(y)]
# 
# # add a new variable to data.table where w = z^2
# DT[,w:=z^2]
# 
# DT[,m:= {tmp <- (x+z); log2(tmp+5)}]
# 
# # plyr like operations
# 
# # add a true false column
# # true if x > 0, else false
# DT[,a:=x>0]
# 
# # b will have one of two values, since a is a booleon and is used for grouping
# DT[,b:= mean(x+w), by=a]
# 
# set.seed(123)
# DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
# # sum the instances of each letter with ".N", grouping by x
# DT[, .N, by=x]
# 
# # using KEYS with data.table
# DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300))
# setkey(DT,x) # set keys to values from 'x' column
# DT['a'] # 'a' is a value from column x, we want the corresponding values
# 
# # data.table merges/joins
# DT1 <- data.table(x=c('a','a', 'b', 'dt1'), y=1:4)
# DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
# DT1
# DT2
# setkey(DT1,x)
# setkey(DT2,x)
# merge(DT1,DT2) # merges rows from data.tables with common keys
# 
# big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
# file <- tempfile()
# write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
# system.time(fread(file))
# system.time(read.table(file,header=TRUE, sep="\t"))
# 
# 
# 
# #hd5f
# #source("http://bioconductor.org/biocLite.R")
# #biocLite("rhdf5")
# library(rhdf5)
# #created = h5createFile("example.h5")
# #created
# 
# #created = h5createGroup("example.h5", "foo")
# #created = h5createGroup("example.h5", "bar")
# #created = h5createGroup("example.h5", "foo/foobaa")
# h5ls("example.h5")
# 
# #A = matrix(1:10, nr=5, nc=2)
# #h5write(A, "example.h5", "foo/A")
# #B = array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
# #attr(B, "scale") <- "liter"
# #h5write(B, "example.h5", "foo/foobaa/B")
# h5ls("example.h5")
# #dim(A)
# 
# readA = h5read("example.h5", "foo/A")
# readA
# 
# # replace the values in column 1 for the first 3 rows with 12,13, and 14
# h5write(c(12,13,14), "example.h5", "foo/A", index=list(1:3,1))
# readA = h5read("example.h5", "foo/A")
# readA
# 
# #reading data from a web page
# con = url("http://aske.ws")
# htmlCode = readLines(con)
# close(con)
# htmlCode

# library(httr)
# html2 = GET("http://aske.ws")
# content2 = content(html2, as="text")
# parsedHTML = htmlParse(content2, asText=TRUE)
# xpathSApply(parsedHTML, "//title", xmlValue)
# 
# #authorization
# pg2 = GET("http://httpbin.org/basic-auth/user/passwd")
#   authenticate("user","passwd")
# pg2
# names(pg2)

# user handles so you only have to login once
# google = handle("http//google.com")
# pg1 = GET(handle=google, path="/")
# pg2 = GET(handle=google, path="search")

# getting data from an api

# httr package?
# oauth_app()
# sign_oauth1.0()
# homedata = get()
# json1 = content(homedata)
# to and from json to get a dataframe 
# json2 = jsonlite::fromJSON(toJSON(json1))
# json2[1,1:4]

# getting data from other sources

# directly from files
# file()
# url()
# gzfile()
# bzfile()
# ?connections for more info
# Remember to CLOSE connections!

# "foreign" package provides many useful read.* methods for foreign data formats

##### Week 3 ##########

set.seed(13435)
X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
X <- X[sample(1:5),];
X$var2[c(1,3)] = NA
X

#first 2 rows and 2nd column
X[1:2, 2]

#subset on condtions (row values)
X[(X$var1 <= 3 & X$var3 > 11), ] # and condition
X[(X$var1 <= 3 | X$var3 > 15), ] # or condition

X[X$var2 >8,] # doesn't ignore NA
X[which(X$var2 >8),] # which command helps ignore NA values

sort(X$var1)
sort(X$var1, decreasing=TRUE)
sort(X$var2, na.last=TRUE)

# sort dataframe by a particular value
X[order(X$var1),]

# sort by multiple values
X[order(X$var1,X$var3),]

# sort using plyr
library(plyr)
arrange(X,var1)
arrange(X,desc(var1)) # descending sort

# add a column to a dataframe
X$var4 <- rnorm(5)
X
# or
Y <- cbind(X,rnorm(5))
Y

# add a row to a dataframe - rbind

# week 2

# file.exists()
# download.file()
# read.csv()

# print top/bottom 3 rows
# head(FRAMENAME,n=3)
# tail(FRAMENAME,n=3)

#summary(FRAMENAME)

# more summary info
#str(FRAMENAME/MATRIX/ETC)

# quantile(DATAFRAME$MEMEBER, na.rm=TRUE)
# quantile(DATAFRAME$MEMEBER, probs=c(0.5,0.75,0.9), na.rm=TRUE)

# table(FRAME$VARIABLE, useNA="ifany")

# table(VAR1,VAR2)

# check for missing values
# sum(is.na(FRAME$VAR))
# any(is.na(FRAME$VAR))

# all(FRAME$VAR > 0)

# colsums(is.na(FRAME))
# all(colsums(is.na(FRAME))==0)

# table(FRAME$VAR %in% c("20212", "20213")) #returns booleans

# FRAME[FRAME$VAR %in% c("20212", "20213"),] # rows with specific values

# how frequently are people admitted, by gender - makes table
# xtabs(Freq ~ Gender + Admit, data=FRAME_NAME)

# add a new column to existing dataframe
warpbreaks$replicate <- rep(1:9, len = 54)
warpbreaks
str(warpbreaks)
# xtab all vars - breaks = values displayed , broken down by other vars
xt = xtabs(breaks ~., data=warpbreaks)
xt
# flatten the output for xt - easier to read
ftable(xt)

# memory sizes
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units="Mb")


seq(1,10,by=2)
seq(1,10,length=3)
x <- c(1,3,8,25,100); seq(along=x) # create an index as same length of data

# add boolean column based on conditional and display the data breakdown
# FRAME$NEWVAR = ifelse(FRAME$VAR < 0, TRUE, FALSE)
# table(FRAME$NEWVAR, FRAME$VAR < 0)

# break down of the Data frame (DF) based on a VAR and quantiles of VAR
# makes a quanittative var into a catagorical representation
# NEW = cut(DF$VAR, breaks=quantile(DF$VAR))
# table(NEW)
warpbreaks
warpbreaks$groups = cut(warpbreaks$replicate, breaks=quantile(warpbreaks$replicate))
table(warpbreaks$groups)
table(warpbreaks$groups, warpbreaks$replicate)

# similer, but more flexible? is cut2

library(Hmisc)
warpbreaks$groups = cut2(warpbreaks$replicate,g=3)
table(warpbreaks$groups)

class(warpbreaks$replicate)

# levels of factor vars
yesno <- sample(c("yes","no"), size=10, replace=TRUE)
yesno
class(yesno)
yesnofac = factor(yesno,levels=c("yes","no"))
yesnofac
class(yesnofac)
as.numeric(yesnofac)