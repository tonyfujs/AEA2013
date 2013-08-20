################################################################################
#######                    Set your working directory here               #######
################################################################################
#setwd("C:/Users/myName/myDocuments")


################################################################################
#######     Set up libraries, default options & custom functions         #######
################################################################################
# Load libraries
library(reshape2)
library(ggplot2)
library(plyr)
library(pander)
# Set up default options
options(stringsAsFactors = FALSE)
# Import custom functions
source('./scripts/functions.r')


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
source('./scripts/analysis.r')

################################################################################
#######                      Publish your results                        #######
################################################################################
# TO DO: FIGURE WORKING DIRECTORY ISSUE + SLIDE GENERATION WITHOUT EDITING

# Generate a markdown document
#Pandoc.brew('./scripts/report.brew', output = './output/reports/tempfile')

# Publish your results as a pdf document
#system("pandoc -s ./output/reports/tempfile -t latex -o ./output/reports/tempfile.pdf")

# Publish your results as a pdf document
Pandoc.brew('./scripts/report.brew', output = 'tempfile', convert = 'pdf')

# Publish your results as a word document
Pandoc.brew('./scripts/report.brew', output = 'tempfile', convert = 'docx')

# Publish your results as a webpage document
#Pandoc.brew('./scripts/report.brew', output = './output/tempfile', convert = 'html')

# Publish your results as a webpage document
Pandoc.brew('./scripts/report.brew', output = './output/reports/tempfile')
# CAUTION: "tempfile" NEEDS EDITING BEFORE TRANSFORMING INTO SLIDES FORMAT
system("pandoc -s -S -i -t dzslides --mathjax ./output/reports/tempfile -o ./output/reports/tempfileWEB.html")

# # Slides----
# library(reports)
# #Pandoc.brew('./scripts/report.brew', output = 'data.md', convert = FALSE)
# reveal.js(in.file = 'smallData.md', theme = "beige", transition = "cube",
#           path = file.path(getwd()), figure.dir = "plots" )
# #Pandoc.brew('./scripts/report.brew', output = 'smallData.md', convert = FALSE)
# # reveal.js(in.file = 'data.md', theme = "beige", transition = "cube",
# #           path = file.path(getwd()), figure.dir = "plots" )