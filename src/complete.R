
complete <- function(directory, id = 1:332) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)

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