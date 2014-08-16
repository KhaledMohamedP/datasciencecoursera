rankall <- function(state, outcome,  num = "best") {
  ## Read outcome data
  file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## the possibiity of outcome options 
  listOutcome <- c("heart attack", "heart failure",  "pneumonia")
  listColIndex <- c(11, 17, 23)
  
  ## Check that state and outcome are valid
  if(!outcome %in% listOutcome){
    stop("invalid outcome")
  }else{
    x <- file[file$State == state, ]
    colIndex <- listColIndex[listOutcome==outcome]
    ## avoid the NA warining and convert to numbers 
    x[, colIndex] <- suppressWarnings(as.numeric(x[, colIndex]))
    
    ##Arrange the order of the list by colIndex and alphabetical names of the hospital 
    resultOrder <-  x[order( x[,colIndex],x[,2]),]
    
    ## convert to data.frame with ranking column 
    dataF <- data.frame(resultOrder[c(2,colIndex)], rank = 1:nrow(resultOrder))
    names(dataF) <- c("Hospital.Name", "Rate", "Rank")
    
    ##base on the num argument 
    if( num == "best"){
      dataF[1,1]
    }else if( num == "worst"){
      ##find the worst value 
      worst <- max(dataF$Rate, na.rm = T)
      ## Find the index #
      index <- which(dataF$Rate==worst)
      #return the name of the hospital 
      dataF[index,1]
    }else if(num>nrow(dataF)){
      NA
    } else{
      dataF[num,1]
    }
  }
}