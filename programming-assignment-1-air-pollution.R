pollutantmean <- function(directory, pollutant, id = 1:332) {
    directory <- 'C:/Users/marti/Documents/rprograming/specdata/'
    fext <- '.csv'
    total = vector('numeric')
    for (item in id) {
        item <- toString(item)
        while (nchar(item) < 3) {
            item <- paste('0', item, sep = '')
            item
        }
        polldata <- na.omit(read.csv(paste(directory, item, fext, sep = '')))
        total <- c(total, polldata[pollutant][[1]])
    }
    print(mean(total))

}

complete <- function(directory, id = 1:332) {
    directory <- paste('C:/Users/marti/Documents/rprograming', directory, sep = '/')
    mydata <- data.frame(id = character(), nobs = integer(0))
    fext <- '.csv'
    for (item in id) {
        item <- toString(item)
        while (nchar(item) < 3) {
            item <- paste('0', item, sep = '')
            item
        }

        file <- paste(directory, item, sep = '/')
        file <- paste(file, fext, sep='')
        polldata <- complete.cases(read.csv(file))
        polldata <- sum(polldata)
        mydata <- rbind(mydata, data.frame(id=item, nobs=polldata))

     }
    mydata
}

corr <- function(directory, threshold = 0) {
    directory <- paste('C:/Users/marti/Documents/rprograming', directory, sep = '/')
    completelyobs <- complete('specdata')
    corrs <- vector('numeric')
    completelyobs <- completelyobs[completelyobs$nobs > threshold, ]
    fext <- '.csv'
    completelyobs
    for (item in completelyobs$id) {
        corrdata <- na.omit(read.csv(paste(directory,'/', toString(item), fext, sep ='')))
        corrs <- c(corrs, cor(corrdata$nitrate, corrdata$sulfate))

    }
    corrs
}
