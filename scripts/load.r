################################################################################
#######       Control loading of data from the "./data/" directory       #######
################################################################################
### Ask user to select between the datasets to be loaded
dataSet <- select.list(choices = c("data","smallData"), 
                       title = "Select the data set to be used for analysis:") 

### Create path to chosen data set
dataPath <- paste('./data/', dataSet, '.csv', sep = "")

### load chosen dataset in R
data <- read.csv(dataPath, header = TRUE)

### Remove temporary objects
rm(dataSet, dataPath)