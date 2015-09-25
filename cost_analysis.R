#Assumes data has been read into variable "data"

get_cost <- function(cost, modifier) {
    mult <- 0

    if(modifier == "K") {
        mult <- 1000
    }

    if(modifier == "M") {
        mult <- 1000000
    }

    if(modifier == "B") {
        mult <- 1000000000 
    }

    cost * mult
}

cost <- data.frame(EVTYPE=data$EVTYPE, PROPDMG=data$PROPDMG, PROPDMGEXP=data$PROPDMGEXP, CROPDMG=data$CROPDMG, CROPDMGEXP=data$CROPDMGEXP)
x <- mapply(get_cost, cost$PROPDMG, cost$PROPDMGEXP) 
y <- mapply(get_cost, cost$CROPDMG, cost$CROPDMGEXP) 
cost$total_cost <- x + y
z <- aggregate(cost$total_cost, by=list(cost$EVTYPE), FUN=sum)
z <- z[sort.list(z$x, decreasing=TRUE),]
head(z)
