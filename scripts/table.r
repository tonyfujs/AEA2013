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
