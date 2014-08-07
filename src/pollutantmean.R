pollutantmean <- function(directory, pollutant, id = 1:332) {
  allElement <- c()
  fileList <- list.files(directory)
  for(i in id){
    ##Read the file 
    filepath <-paste(directory,fileList[i], sep="/")
    file <- read.csv(filepath)
    
    ##add all element 
    allElement <- c(allElement,file[[pollutant]]) 
  }
 meanValue<- mean(allElement,na.rm =TRUE)
 
}