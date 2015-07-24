corr <- function(directory, threshold = 0) {
        # 1. get the number of complete cases using complete()
        x <- complete(directory)
        # 2. check to see how many are above the threshold
        y <- subset(x, nobs > threshold)
        
        # 3. if any are above the threshold, calculate the correlation
        if (nrow(y) > 0) {
                z <- lapply(y$id, multimerge2, directory)
                # here, not sure how to specify just take nitrate & sulfate but i know they're the 
                # 2nd and 3rd columns of each data frame, so use an anonymous function to isolate them
                test <- lapply(z, function(x) x[,2:3])
                # run the the cor function iteratively through each
                test2 <- sapply(test, cor, use="complete.obs")
                # keep just the rows of the cor function that contain what i need
                return(test2[2,])
        } else {
                test2 <- vector("numeric", length=0)
                return(test2)
        }
}