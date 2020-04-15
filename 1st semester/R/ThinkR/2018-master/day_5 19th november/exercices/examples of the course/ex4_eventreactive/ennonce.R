library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput("ex4_titre", label = "title", value = "Histogram"),
      sliderInput("ex4_n", label = "size", min = 100, max= 1000, value = 500), 
      fluidRow(
        column(6, sliderInput("ex4_mean", "mean", value = 0, min=-5, max = 5)), 
        column(6, sliderInput("ex4_sd", "sd", value = 1, min=0, max = 5))
      ), 
      actionButton( "ex4_go", "Go")
      
    ), 
    mainPanel( 
      plotOutput("ex4_hist")
    )
  )
)
server <- function(input, output) {
  
  ex4_data <- reactive({

      rnorm( input$ex3_n, mean = input$ex3_mean, sd = input$ex3_sd )

    
  })
  
  output$ex4_hist <- renderPlot({
    x <- ex4_data()
    hist( x , col="purple", main = input$ex4_titre )
    rug( x )
    
  }, width = 600 )
}

shinyApp(ui,server)