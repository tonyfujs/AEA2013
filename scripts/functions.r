################################################################################
#######                 Create various plotting functions                #######
################################################################################
### Create a custom function for distribution plot
distPlot <- function(df) {
  #myFont <- 'serif' ## PROBLEM: Error in eval(expr, envir, enclos) : object 'myFont' not found
  #myTitle <- c("Customized title")
  
  ggplot(df, aes(x = score, fill = prepost)) + 
    geom_density(alpha=.5) +
    theme_classic()
}  

### Create a custom function for Box plots
boxPlot <- function(df) {
  ggplot(df, aes(x = prepost, y = score, fill = prepost)) + 
  geom_boxplot(alpha=.5) +
  theme_classic() +
  theme(legend.position="none")
}

##Create a custom function for  Bar plots
barPlot <- function(df) {
  mm <- ddply(df, "prepost", summarise, 
              meanScore = mean(score),
              stdScore = sd(score))
  ggplot(mm, aes(x = prepost, y = meanScore, fill = prepost)) + 
  geom_bar(alpha = .5, stat = 'identity', width = .5) +
  theme_classic() +
  theme(legend.position="none")
}

### Create a custom function for Bar plot with error bars
barPlotE <- function(df) {
  out <- barPlot(df)
  out <- out +
    geom_errorbar(aes(ymax = meanScore + stdScore, ymin = meanScore - stdScore), position="dodge", width = .1)
  out
}
  
  
  
  
  
  
  
  