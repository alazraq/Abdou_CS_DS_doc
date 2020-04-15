library(shiny)
library(ggplot2)

scatterPlot <- function(data, cols) {
  ggplot(data, aes_string(x = cols[1], y = cols[2])) +
    geom_point(aes(color = selected_)) +
    scale_color_manual(values = c("black", "#66D65C"), guide = FALSE)
}

linkedScatterUI <- function(id) {
  ns <- NS(id)
  
  fluidRow(
    column(6, plotOutput(ns("plot1"), brush = ns("brush"))),
    column(6, plotOutput(ns("plot2"), brush = ns("brush")))
  )
  
}

linkedScatter <- function(input, output, session, data, left, right) {
  dataWithSelection <- reactive({
    brushedPoints(data(), input$brush, allRows = TRUE)
  })
  
  output$plot1 <- renderPlot({
    scatterPlot(dataWithSelection(), left())
  })
  
  output$plot2 <- renderPlot({
    scatterPlot(dataWithSelection(), right())
  })
  
  return(dataWithSelection)
}


ui <- fluidPage(
  linkedScatterUI( "plots" )
)

server <- function(input, output) {
  
  left <- function(){
    c("Sepal.Length", "Sepal.Width")
  }
  
  right <- function(){
    c("Petal.Length", "Petal.Width")
  }
  
  data <- function(){
    iris
  }
  
  selection <- callModule( linkedScatter, "plots", 
    data = data, left = left, right = right 
  )
}

shinyApp(ui = ui, server = server)

