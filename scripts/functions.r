################################################################################
#######                 Create various plotting functions                #######
################################################################################
### Create a custom function for distribution plot
distPlot <- function(df) {
  #myFont <- 'serif' ## PROBLEM: Error in eval(expr, envir, enclos) : object 'myFont' not found
  #myTitle <- c("Customized title")
  
  p <- ggplot()
  p <- p + geom_density(data = df, aes(x = score, fill = prepost), alpha = .5) 
  p <- p + theme_classic()
  p
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
  mm <- ddply(df, .(prepost, location), summarise, 
              meanScore = mean(score),
              stdScore = sd(score))
  p <- ggplot()
  p <- p + geom_bar(data = mm,
                    aes(x = prepost, y = meanScore, fill = prepost),
                    alpha = .5, stat = 'identity', width = .5)
  p <- p + theme_classic() 
  p <- p + theme(legend.position="none")
  p <- p + ylim(0,100)
  p
}

### Create a custom function for Bar plot with error bars
barPlotE <- function(df) {
  mm <- ddply(df, .(prepost, location), summarise, 
              meanScore = mean(score),
              stdScore = sd(score))
  p <- ggplot(data = mm)
  p <- p + geom_bar(aes(x = prepost, y = meanScore, fill = prepost),
                    alpha = .5, stat = 'identity', width = .5)
  p <- p + theme_classic() 
  p <- p + theme(legend.position="none")
  p <- p + ylim(0,100)
  
  p <- p + geom_errorbar(aes(x = prepost,
                             ymax = ifelse(meanScore + stdScore <= 100, 
                                           meanScore + stdScore, 100), 
                             ymin = ifelse(meanScore - stdScore >= 0,
                                           meanScore - stdScore, 0)),
                         position="dodge", width = .1)
  p
}


### Create a custom function for line plot with error bars
linePlotE <- function(df) {
  mm <- ddply(df, .(prepost, location), summarise, 
              meanScore = mean(score),
              stdScore = sd(score))
  p <- ggplot(data = mm)
  p <- p + geom_line(aes(x = prepost, y = meanScore, group=1),
                     stat = 'identity', size = 1)
  p <- p + theme_classic() 
  p <- p + theme(legend.position="none")
  p <- p + ylim(0,100)
  
  p <- p + geom_errorbar(aes(x = prepost,
                             ymax = ifelse(meanScore + stdScore <= 100, 
                                           meanScore + stdScore, 100), 
                             ymin = ifelse(meanScore - stdScore >= 0,
                                           meanScore - stdScore, 0)),
                         width = .1, size = 1)
  
  p <- p + geom_point(aes(x = prepost, y = meanScore, fill = prepost),
                      shape = 21, size = 6)
  
  
  p
}
  
################################################################################
#######                 Create a plotting function for shiny app         #######
################################################################################  
shinyPlot <- function(df, type) {
  if (type == "barPlot") { p <- barPlot(df)}
  if (type == "barPlotE") { p <- barPlotE(df)}
  if (type == "boxPlot") { p <- boxPlot(df)}
  if (type == "distPlot") { p <- distPlot(df)}
  if (type == "linePlotE") { p <- linePlotE(df)}
  p
}  
  
  
  
  
  