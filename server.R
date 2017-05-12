library(shiny)
library(plotly)
library(dplyr)

df <- read.csv("arsondeathsbyyear.csv")

function(input, output) {
  
  linechart_data <- reactive({
    
    out <- df %>%
      filter(
             YEAR %in% input$years[1]:input$years[2])
    
    return(out)
    
  })
  
  output$linechart <- renderPlotly({
    
    plot_ly(linechart_data(), x = ~YEAR, y = ~DEATHS) %>%
      add_lines() %>%
      layout(xaxis = list(title = "Year"),
             yaxis = list(title = "Arson Deaths"))
    
  })
  
}