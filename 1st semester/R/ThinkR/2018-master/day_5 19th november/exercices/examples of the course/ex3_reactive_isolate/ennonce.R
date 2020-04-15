library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput("ex3_titre", label = "title", value = "Histogram"),
      sliderInput("ex3_n", label = "size", min = 100, max= 1000, value = 500), 
      fluidRow(
        column(6, sliderInput("ex3_mean", "mean", value = 0, min=-5, max = 5)), 
        column(6, sliderInput("ex3_sd", "sd", value = 1, min=0, max = 5))
      ), 
      actionButton( "ex3_go", "Go")
      
    ), 
    mainPanel( 
      plotOutput("ex3_hist")
    )
  )
)
server <- function(input, output) {
  
  ex3_data <- reactive({

      rnorm( input$ex3_n, mean = input$ex3_mean, sd = input$ex3_sd )

    
  })
  
  output$ex3_hist <- renderPlot({
    x <- ex3_data()
    hist( x , col="purple", main = input$ex3_titre )
    rug( x )
    
  }, width = 600 )
}

shinyApp(ui,server)