getmonitor <- function(id, directory, summarize = FALSE) {
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  if(!missing(id) && !missing(directory)) {
    #print("File Info May be ok") 
    #print(cbind(directory, as.character(id),".csv"))
    #mon_path_parts <- cbind(directory, as.character(id),".csv")
    WD <- getwd()
    setwd(directory)
    mon_path_parts <- cbind(sprintf("%03d",as.integer(id)),".csv")
    mon_path <- paste(mon_path_parts, collapse = '') 
    #mon_path <- sprintf("%03d",as.integer(id))
    #print(mon_path)
    
    mon_data <- read.csv(mon_path, header=TRUE)
    
    setwd(WD)
    return(mon_data)
    #mon <- read.csv("specdata/")

  }
  else {
    #print("Missing File Info")  
  }


  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  
  ## Your code here
}