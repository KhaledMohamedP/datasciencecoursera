complete <- function(directory, id = 1:332) {
  nobs <- c()
  fileList <- list.files(directory)
  for(i in id){
    ##Read the file 
    filepath <-paste(directory,fileList[i], sep="/")
    file <- read.csv(filepath)
    
    ##clean the data 
    good <- complete.cases(file[["sulfate"]], file[["nitrate"]])
    nobs <- c(nobs,length(good[good]))
  }
  data.frame(id,nobs) 
  
}