setwd("C:\\Users\\Shopsmartin\\Desktop\\datasciencecoursera\\rprog Fdata ProgAssignment3-data")
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

head(outcome)
dim(outcome)
names(outcome)
outcome[, 11] <- as.numeric(outcome[, 11])

hist(outcome[, 11])




best <- function(state, outcomeName) {
    checkarg <- function(state) {
        state %in% state.abb
    }
    cols <- c(11, 17, 23)
    names(cols) <- c("heart attack", "heart failure", "pneumonia")
    outcomeName <- tolower(outcomeName)
    if (!checkarg(state)) { stop("Invalid State") }
    else if (!is.element(outcomeName, c("heart attack", "pneumonia", "heart failure"))) {stop("invalid outcome") }
    else {
        outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")[, c(2, 7, cols[outcomeName])]
        names(outcome) <- c("hosp", "state", "rate")
        outcome[outcome == "Not Available"] = NA
        outcome <- outcome[order(outcome$rate,outcome$hosp),]
    }
    outcome$hosp[1]
}






[23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
[17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
11"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"