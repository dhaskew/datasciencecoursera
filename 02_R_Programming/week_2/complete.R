complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  source('getmonitor.R')
  
  rc_list <- list()
  id_list <- list()
  
  #print(class(id_list))
  #print(class(rc_list))
  
  for(i in 1:length(id)) {
   # print(i)

  data <- getmonitor(id[i], "specdata", TRUE)
  
  rc <- nrow(na.omit(data))
  #print(rc)
  #y2 <- sapply(mat1.df, function(x, y) sum(x) + y, y = 5)

  id_list <- as.integer(c(id_list,id[i]))
  #id_list <- c(1:5)
  rc_list <- as.integer(c(rc_list,rc))
  #rc_list <- c(6:10)
  
  #print("id list")
  #print(id_list)
  #print("rc list")
  #print(rc_list)
    
  #print(class(id_list))
  #print(class(rc_list))
  
  }
  
  df <- data.frame(id_list,rc_list)
  colnames(df) [1] <- "id"
  colnames(df) [2] <- "nobs"
  
  
  return(df)
  
}