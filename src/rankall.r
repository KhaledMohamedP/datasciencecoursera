rankall <- function(outcome,  num = "best") {
  ## Read outcome data
  file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## the possibiity of outcome options 
  listOutcome <- c("heart attack", "heart failure",  "pneumonia")
  listColIndex <- c(11, 17, 23)
  
  ## Check that state and outcome are valid
  if(!outcome %in% listOutcome){
    stop("invalid outcome")
  }else{
    x <- file
    colIndex <- listColIndex[listOutcome==outcome]
    ## avoid the NA warining and convert to numbers 
    x[, colIndex] <- suppressWarnings(as.numeric(x[, colIndex]))
    
    ##Arrange the order of the list by colIndex and alphabetical names of the hospital 
    resultOrder <-  x[order( x[,colIndex],x[,7], x[,2]),]
    ## convert to data.frame with ranking column 
    dataF <- data.frame(resultOrder[c(2,7,colIndex)])
    names(dataF) <- c("hospital", "state", "rank")
    completeVec <- complete.cases(dataF[, "rank"])
    
    dataF <- dataF[completeVec, ]
    dataF
   rankState <- split(dataF, dataF$state)
   
   
 
   
   
   
  }
}