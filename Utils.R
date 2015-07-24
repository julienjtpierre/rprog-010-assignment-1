multimerge = function(directory){
        files <- list.files(path = directory, pattern = "*.csv", full.names = TRUE, recursive = FALSE)
        datalist <- lapply(files, function(x) { read.csv(x) })
        datalist = do.call("rbind", datalist)
}

multimerge2 <- function(id, directory, summarize = FALSE) {
        
        sourcedir <- getwd()
        
        # step1: create the full path to the source file
        y <- as.numeric(id)
        
        # make this more elegant
        if(y < 10){
                x<-paste("00",y,".csv",sep="")
        } else if(y >= 10 && y < 100){
                x<-paste("0",y,".csv",sep="")
        } else {
                x<-paste(y,".csv",sep="")
        }
        
        dataset <- read.csv(paste(sourcedir, x, sep="/specdata/"))
        
        # step2: create a summary base on summarize
        if(summarize == TRUE){
                summary(dataset)
        }  
        return(dataset)
}