QDF <- fread('./getdata-data-ss06hid.csv')
setkey(QDF, VAL)
QDF[,k:=VAL>=24]
table(QDF$k) # 53

head(QDF$FES)

# xlsx package
# colIndex <- 2:3
# rowIndex <- 1:4
# read only the 2nd and 3rd columns in from rows 1 thru 4
# read.xlsx("./filename.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
# write.xlss
library(xlsx)
dat <- read.xlsx('./getdata%2Fdata%2FDATA.gov_NGAP.xlsx', sheetName="NGAP Sample Data",colIndex = 7:15, rowIndex = 18:23, as.data.frame=TRUE, header=TRUE)
dat
sum(dat$Zip*dat$Ext,na.rm=TRUE) # 36534720

# reading xml
library(XML)
doc <- xmlTreeParse("./getdata%2Fdata%2Frestaurants.xml", useInternal=TRUE)
rootNode <- xmlRoot(doc)
#xmlName(rootNode)
#names(rootNode)
#rootNode[[1]] # access 1st root element
# rootNode[[1]][[1]] # access 1st subcomponent of the 1st root element
# xmlSApply(rootNode, xmlValue)

# XPath #127
zips <- xpathSApply(rootNode, "//zipcode", xmlValue) # get xmlValue part of "name" nodes
table(zips)

DT <- fread("./getdata%2Fdata%2Fss06pid.csv")
system.time( tapply(DT$pwgtp15,DT$SEX,mean) )
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(DT[,mean(pwgtp15),by=SEX])
t0 <- function()
{
  mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
}

t1 <- function()
{
  rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
}
system.time(t0())
#system.time( mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15) )
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))