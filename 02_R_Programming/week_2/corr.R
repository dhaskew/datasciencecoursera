corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  rvec<- numeric() # an empty vector to return
    
  source('getmonitor.R')
  
  source('complete.R')
  
  clist <- complete(directory='specdata', 1:332)


  
  clist.thresh <- subset(clist, nobs > threshold)

  num_files = nrow(clist.thresh)

if(num_files > 0) {
  
  for(i in 1:nrow(clist.thresh)){
    #print(clist.thresh$id[i])
    #print(clist.thresh$nobs[i])
    
    #cc<-sum(complete.cases(gm))

    gm <- getmonitor(clist.thresh$id[i], "specdata")
    #print(class(gm))
    gm_pruned <- na.omit(gm)
    cval<- cor(gm_pruned$sulfate,gm_pruned$nitrate)
    #print(cval)
    rvec <- append(rvec, cval)
  }
}
  return(rvec)
  
}