rankall <- function(outcome, num="best")
{
  
  ## Read outcome data
  setwd("~/code/projects/datasciencecoursera/02_R_Programming/week_4/")
  
  #read in outcome data
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #str(outcomes)
  
  #coerce the columns to the correct format
  outcomes[, 11] <- as.numeric(outcomes[, 11]) #heart attack
  outcomes[, 17] <- as.numeric(outcomes[, 17]) #heart failure
  outcomes[, 23] <- as.numeric(outcomes[, 23]) #pneumonia
  
  
  ## Check that state and outcome are valid
  
  #determine the list of states
  sub.states <- table(outcomes$State) >= 1
  
  #convert the subselction to an array
  sub.array <- subset(sub.states, sub.states==TRUE)
  sub.wanted <- dimnames(sub.array)
  
  #if(state[1] %in% sub.wanted[[1]][]){
  #  vs <- 1
  #}
  #else {
  #  stop("invalid state")
  
#}
  
  if(outcome != 'heart attack'){
    if(outcome != 'heart failure'){
      if(outcome != 'pneumonia'){
        stop("invalid outcome")
      }
    }
  }

  # valid params, continue on
  
  if(outcome == 'pneumonia'){
   o <- 23
  }

  if(outcome == 'heart attack'){
    o <- 11
  }
  
  # question 1
  out <- outcomes[c(2,7,11)]
  #out2 <- subset(out, State==state[1])
  #out3 <- out2[order(out2[,3]) ,]
  #o2 <- subset(outcomes[order(outcomes[,11]),], State==state[1])
  #print(out3)
  #ovss <- vss[order(vss[,o]),]

  #m <- max(vss[,o], na.rm=TRUE)
  #m <- vss[order(vss[,o]),]
  #print(vss[,2])
  #print(vss[,o])
  #ss <- subset(vss, vss[,o] == m)
  #print(m)
  #print(m)
  #print(ss[,2])
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  #ss[,2]
  #out3[7,1]

  outcomes2 <- outcomes[order(outcomes[,11]),]

  out<- outcomes2[,c(7,2)]

  colnames(out)[1] <- "hospital"
  colnames(out)[2] <- "state"
  out2 <- out[1:4,c(1,2)]
  out2
}

foo <- rankall("heart attack",7)
str(foo)