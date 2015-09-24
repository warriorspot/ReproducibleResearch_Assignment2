#data <- read.csv("repdata-data-StormData.csv")
data$HEALTH_EFFECTS <- data$INJURIES + data$FATALITIES

health <- aggregate(data$HEALTH_EFFECTS, by=list(data$EVTYPE), FUN=sum)
health <- health[sort.list(health$x, decreasing=TRUE),]
names(health) <- c("type", "count")
#Top ten most harmful weather event types
head(health, n=10)

