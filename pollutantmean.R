pollutantmean <- function(directory, pollutant, id = 1:332) {
        data <- multimerge(directory)
        mean(data[data$ID %in% id, pollutant], na.rm = T)
}