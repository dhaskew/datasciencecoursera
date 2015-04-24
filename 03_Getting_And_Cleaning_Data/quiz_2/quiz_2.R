
#question 1
library(httr)
library(httpuv)
library(jsonlite)
oauth_endpoints("github")
myapp <- oauth_app("github", "8eeae322458448342d7f", "134dba5fcf019dc9d2c41376943cc2e00b947be5")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache=FALSE)

gtoken <- config(token = github_token)
#req <- GET("https://api.github.com/rate_limit", gtoken)
#stop_for_status(req)
#content(req)
req2 <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req2)
json1 = content(req2)
json2 = jsonlite::fromJSON(toJSON(json1))
json3 = json2[,c(2,45)]
subset(json3, (name %in% 'datasharing'))

# question 2
library(sqldf)
acs <- read.csv('getdata-data-ss06pid.csv')
sqldf("select pwgtp1 from acs where AGEP < 50")

# question 3
sqldf("select distinct AGEP from acs")

# question 4
library(httr)
html2 = readLines("http://biostat.jhsph.edu/~jleek/contact.html")
#content2 = content(html2, as="text")
nchar(html2[10])

#question 5
data31 <- read.fwf("getdata-wksst8110.for",widths=c(10,5,4,4,5,4,4,5,4,4,5,4,4), skip=4)
as.numeric(as.character(data31$V6))
sum(data31$V6)
