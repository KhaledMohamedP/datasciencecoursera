##Part 1

best <- function(state, outcome){
  
  ## let's read our file first
  file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## the possibiity of outcome options 
  listOutcome <- c(“heart attack”, “heart failure”,  “pneumonia”)
  listColIndex <- c(11, 17, 23)
  
  if(!state %in% file$State){
    "ERROR: State doesn't exist in the file"
  }else if(!outcome %in% listOutcome){
    "ERROR: Column doen't exist in the file "
  }else{
    x <- file[file$State == state, ]
    ## avoid the NA warining and convert to numbers 
    colIndex <- listColIndex[listOutcome==outcome]
    y <- suppressWarnings(as.numeric(x[, colIndex]))
    
    ## find the minumum value in the col. 
    minm <- min(y[complete.cases(y)])

    ##return the name of the hosptial which retrun the index of min
    index <- which
    ## return the name of the hosptial col#2 and the index 
    x[index, 2]
    
  }
}


##Part 2
