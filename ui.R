library(shiny)
library(plotly)

df <- read.csv("arsondeathsbyyear.csv")

fluidPage(
  
  titlePanel("Arson deaths by selected years"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("years",
                  "Select a range of years",
                  min = 2010,
                  max = 2015,
                  value = c(2010, 2010),
                  sep = "")
    ),
    
    mainPanel(
      plotlyOutput("linechart")
    )
  )
)