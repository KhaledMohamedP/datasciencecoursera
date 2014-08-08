pollutantmean <- function(directory, pollutant, id = 1:332) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)

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