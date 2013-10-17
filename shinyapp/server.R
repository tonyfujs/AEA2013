library(shiny)
library(ggplot2)
#load("../output/savedObjects.RData")



# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Compute the plot name in a reactive expression
  formulaText <- reactive({
    paste(input$plotType)
  })
  
  # Return the plot name for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested plots by location 
  output$plot <- renderPlot({
    #print(qplot(longData$score))
    p <- shinyPlot(df = longData, type = formulaText()) 
    p <- p + facet_wrap( ~ location)
    print(p)
  })
})

  
