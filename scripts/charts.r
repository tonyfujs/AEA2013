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













