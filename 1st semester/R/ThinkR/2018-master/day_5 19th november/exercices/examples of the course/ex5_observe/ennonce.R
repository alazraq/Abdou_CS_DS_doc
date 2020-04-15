library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput("ex5_titre", label = "title", value = "Histogram"),
      sliderInput("ex5_n", label = "size", min = 100, max= 1000, value = 500), 
      fluidRow(
        column(6, sliderInput("ex5_mean", "mean", value = 0, min=-5, max = 5)), 
        column(6, sliderInput("ex5_sd", "sd", value = 1, min=0, max = 5))
      ), 
      actionButton( "ex5_go", "Go")
      
    ), 
    mainPanel( 
      plotOutput("ex5_hist")
    )
  )
)
server <- function(input, output) {
  
  ex5_data <- eventReactive(input$ex5_go, {
    rnorm( input$ex5_n, mean = input$ex5_mean, sd = input$ex5_sd )
  })
  
  output$ex5_hist <- renderPlot({
    x <- ex5_data()
    hist( x , col="purple", main = input$ex5_titre )
    rug( x )
    
  }, width = 600 )
}

shinyApp(ui,server)