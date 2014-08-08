corr <- function(directory, threshold = 0) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations

cr <- c()
fileList <- list.files(directory)  
for(i in 1:332){
  
    ##Read the file 
    filepath <-paste(directory,fileList[i], sep="/")
    file <- read.csv(filepath)
    
    ##clean the data 
    good <-  file[complete.cases(file),]
    
    ##calc the cor base on the threshold
    if(nrow(good) > threshold){
      cr <- c(cr,  cor(good$sulfate, good$nitrate))
    }
  }
  cr
}