################################################################################
#######                     Create summary table                         #######
################################################################################
### Generate table with basic summary statistics
summaryTable <- ddply(data, c('location'), summarise,
											meanScore1 = round(mean(score1), 2),
											#sdPre = round(sd(pre), 2),
											meanScore2 = round(mean(score2), 2),
											#sdPost = round(sd(post), 2),
											meanChange = round(mean(change), 2),
											sdChange = round(sd(change), 2))
### Add statistical tests
# Define p-value for statistical tests
pValueCutoff <- 0.05

# Conduct ttest
ttest <- ddply(longData,"location",
      function(x) {
        w <- t.test(score ~ prepost, data = x)
        with(w,data.frame(statistic,p.value))
      })

# Merge summaryTable & ttest
summaryTable <- merge(summaryTable, ttest)
### Change row.names of summaryTable
row.names(summaryTable) <- summaryTable$location
summaryTable <- summaryTable[, !colnames(summaryTable) %in% c('location')]

################################################################################
#######                     Create summary paragraph                     #######
################################################################################
### Create a sentence describing main results
summaryTable$sentence1 <- sprintf("On average, students from %s showed a change of %s points of their scores (plus or minus %s points.)",
        row.names(summaryTable),
        summaryTable$meanChange,
        summaryTable$sdChange)
### Create another sentence with results of statistical tests
summaryTable$sentence2 <- ifelse(ttest[,'p.value'] < 0.05,
  sprintf('With a p-value of %s, we can be relatively confident that this change in scores is not due to chance',
          round(ttest$p.value, 3)),
  sprintf('With a p-value of %s, it is likely that this change in scores is only the result of chance',
          round(ttest$p.value, 3)))

################################################################################
#######                     Create various charts                        #######
################################################################################
### Distribution plot
distPlotList <- dlply(longData, .(location), function(x) distPlot(x))
### Box plot
boxPlotList <- dlply(longData, .(location), function(x) boxPlot(x))
###Bar plot
barPlotList <- dlply(longData, .(location), function(x) barPlot(x))
### Bar plot with error bar
barPlotEList <- dlply(longData, .(location), function(x) barPlotE(x))
### Line plot with error bar
linePlotEList <- dlply(longData, .(location), function(x) linePlotE(x))













