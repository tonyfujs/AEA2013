library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("AEA Test"),
  
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    tags$head(
      tags$style(type="text/css", "select { max-width: 200px; }"),
      tags$style(type="text/css", "textarea { max-width: 185px; }"),
      tags$style(type="text/css", ".jslider { max-width: 200px; }"),
      tags$style(type='text/css', ".well { max-width: 310px; }"),
      tags$style(type='text/css', ".span4 { max-width: 310px; }")
    ),
    
    selectInput("plotType", "Plot Type:",
                list("Bar Plot" = "barPlot", 
                     "Bar Plot + Error" = "barPlotE",
                     "Line Plot + Error" = "linePlotE",
                     "Box Plot" = "boxPlot",
                     "Distribution Plot" = "distPlot"))
    ),
  
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("plot", height = 700))
))