corr <- function(directory, threshold = 0) {
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