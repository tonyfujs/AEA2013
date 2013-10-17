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
