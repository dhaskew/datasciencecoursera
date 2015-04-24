best <- function(state, outcome) {
  
  ## Read outcome data
  setwd("~/code/projects/datasciencecoursera/02_R_Programming/week_4/")
  
  #read in outcome data
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #str(outcomes)
  
  #coerce the columns to the correct format
  outcomes[, 11] <- as.numeric(outcomes[, 11])
  outcomes[, 17] <- as.numeric(outcomes[, 17])
  outcomes[, 23] <- as.numeric(outcomes[, 23])
  
  
  ## Check that state and outcome are valid
  
  #determine the list of states
  sub.states <- table(outcomes$State) >= 1
  
  #convert the subselction to an array
  sub.array <- subset(sub.states, sub.states==TRUE)
  sub.wanted <- dimnames(sub.array)
  
  if(state[1] %in% sub.wanted[[1]][]){
    vs <- 1
  }
  else {
    stop("invalid state")
  }
  
  if(outcome != 'heart attack'){
    if(outcome != 'heart failure'){
      if(outcome != 'pneumonia'){
        stop("invalid outcome")
      }
    }
  }

  # valid params, continue on
  
  if(outcome == 'pneumonia'){
   # print('pneumonia selected')
  }
  
  # question 1
  vss <- subset(outcomes, State==state[1])
  m <- min(vss[,23], na.rm=TRUE)
  ss <- subset(vss, vss[,23] == m)
  #print(m)
  #print(ss[,2])
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  ss[,2]
}

#best("SC", "heart attack")
#best("NY", "pneumonia")