################################################################################
#######               Conduct various data management tasks              #######
################################################################################

# Create a vector of location names
location <- unique(data$location)

# Create a long version of the dataset
longData <- melt(data, id = c('id', 'location'))
# Rename the "longData" dataset columns
names(longData) <- c('id', 'location', 'prepost', 'score')

# Create a new variable showing change between score1 and score2
data$change <- data$score2 - data$score1
