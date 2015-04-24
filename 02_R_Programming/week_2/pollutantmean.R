pollutantmean <- function(directory, pollutant, id = 1:332) {
  source('getmonitor.R')
  source('complete.R')
  wd <- getwd()
  #print('hello 1')
  clist <- complete(directory, id)
  #print('hello 2')
  #clist
  rvec<- data.frame()
  num_files = nrow(clist)
  setwd(directory)
  if(num_files > 0) {
    #print('hello 3')
    for(i in 1:nrow(clist)){
      #print(clist)
      mon_path_parts <- cbind(sprintf("%03d",as.integer(id)),".csv")
      #print(mon_path_parts)
      mon_path <- paste(mon_path_parts[i,], collapse = '')
      mon_data <- read.csv(mon_path, header=TRUE)
      #print(mon_data)
      mon_data_pruned <- na.omit(mon_data)
      print(mon_data_pruned)
      #print(class(mon_data_pruned$nitrate))
      #cval<- mean(mon_data_pruned$sulfate)
      #rvec <- (mon_data_pruned[pollutant])
      rvec <- append(rvec,mon_data_pruned[$nitrate])
      #print(class(rvec))
      #print(rvec)
      #print(cval)
#       cval<- cor(gm_pruned$sulfate,gm_pruned$nitrate)
      #rvec <- append(rvec, mon_data_pruned)
      #rvec <- rvec + mon_data_pruned
      #print(nrow(rvec$nitrate))
      #print(rvec)
    }
   }
   setwd(wd)
   return(mean(rvec$nitrate))
}

x <- pollutantmean("specdata", pollutant="nitrate",70:72)
x
