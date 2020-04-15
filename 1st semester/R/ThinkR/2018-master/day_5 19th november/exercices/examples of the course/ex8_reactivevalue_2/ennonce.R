library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput("ex8_titre", label = "title", value = "Histogram"),
      sliderInput("ex8_n", label = "size", min = 100, max= 1000, value = 500), 
      fluidRow(
        column(6, sliderInput("ex8_mean", "mean", value = 0, min=-5, max = 5)), 
        column(6, sliderInput("ex8_sd", "sd", value = 1, min=0, max = 5))
      ),
      fluidRow(
        column(6, sliderInput("ex8_min", "min", value = 0, min=-5, max = 5)), 
        column(6, sliderInput("ex8_max", "max", value = 1, min=0, max = 5))
      ),
      fluidRow(
        actionButton(inputId = "normal",label = "normal"),
        actionButton(inputId = "uniform",label = "uniform")
        
      )
    ), 
    mainPanel( 
      tabPanel("graph", plotOutput("ex8_hist") )
      
    )
  )
)

server <- function(input, output) {
  
  data <- reactiveValues(x = rnorm(100))
  
  
  observeEvent(input$go,{
    
    data$x <- rnorm( input$ex8_n, mean = input$ex8_mean, sd = input$ex8_sd )
    
  })
  
  
  
  output$ex8_hist <- renderPlot({
    x <- data$x
    hist( x , col="purple", main = input$ex8_titre )
    rug( x )
  }, width = 600 )

}

shinyApp(ui,server)