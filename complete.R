complete <- function(directory, id = 1:332) {
        x <- lapply(id, multimerge2, directory)
        y <- lapply(x, na.omit)
        nobs <- sapply(y, nrow)
        final <- data.frame(id, nobs)
        return(final)
}