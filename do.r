################################################################################
#######                    Set your working directory here               #######
################################################################################
#setwd("C:/Users/myName/myDocuments")


################################################################################
#######     Set up libraries, default options & custom functions         #######
################################################################################
source('./scripts/profile.r')


################################################################################
#######                          Import data in R                        #######
################################################################################
source('./scripts/load.r')


################################################################################
#######                        Clean and recode data                     #######
################################################################################
source('./scripts/clean.r')


################################################################################
#######                            Analyze data                          #######
################################################################################
### Create a summary table
source('./scripts/table.r')

### Create a dynamic paragraph
source('./scripts/paragraph.r')

### Create some charts
source('./scripts/charts.r')


### Save created objects
#save.image(file = "./output/savedObjects.RData")

################################################################################
#######                      Publish your results                        #######
################################################################################
# Publish your results as a pdf document
Pandoc.brew('./scripts/report.brew', output = 'tempfile', convert = 'pdf')

# Publish your results as a word document
Pandoc.brew('./scripts/report.brew', output = 'tempfile', convert = 'docx')

# Publish your results as a webpage document
Pandoc.brew('./scripts/report.brew', output = 'tempfile', convert = 'html')

# CAUTION: "tempfile" NEEDS EDITING BEFORE TRANSFORMING INTO SLIDES FORMAT
#system("pandoc -s -S -i -t dzslides --mathjax ./output/reports/tempfile -o ./output/reports/tempfileWEB.html")

# Slides----
#library(reports)
#Pandoc.brew('./scripts/report.brew', output = 'data.md', convert = FALSE)
#reveal.js(in.file = 'smallData.md', theme = "beige", transition = "cube",
#          path = file.path(getwd()), figure.dir = "plots" )
#Pandoc.brew('./scripts/report.brew', output = 'smallData.md', convert = FALSE)
#reveal.js(in.file = 'data.md', theme = "beige", transition = "cube", path = file.path(getwd()), figure.dir = "plots" )

#author("mydeck")

### Save created objects
#save.image(file = "./output/workspaceSlides.RData")
#setwd('./mydeck')

#slidify("index.Rmd")



################################################################################
#######                      Publish your results (SHINY)                #######
################################################################################

### Run shiny app interactively
runApp("./shinyapp")

### Run shiny app via system()
#system("R -e shiny::runApp('./shinyapp')")









