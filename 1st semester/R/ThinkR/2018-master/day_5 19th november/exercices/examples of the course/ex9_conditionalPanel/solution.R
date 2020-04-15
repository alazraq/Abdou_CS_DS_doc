library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput("ex9_titre", label = "title", value = "Histogram"),
      sliderInput("ex9_n", label = "size", min = 100, max= 1000, value = 500), 
      selectInput( "distribution", label = "distribution", choices = c("normal", "uniform"), selected = "normal" ),
      conditionalPanel( 'input.distribution == "normal" ',
        fluidRow(
          column(6, sliderInput("ex9_mean", "mean", value = 0, min=-5, max = 5)), 
          column(6, sliderInput("ex9_sd", "sd", value = 1, min=0, max = 5))
        )
      ),
      conditionalPanel( 'input.distribution == "uniform" ',
        fluidRow(
          column(6, sliderInput("ex9_min", "min", value = 0, min=-5, max = 5)), 
          column(6, sliderInput("ex9_max", "max", value = 1, min=0, max = 5))
        )
      )
    ), 
    mainPanel( 
        tabPanel("graphique", plotOutput("ex9_hist") )
      
    )
  )
)

server <- function(input, output) {
  
  
  data <- reactiveValues(x = rnorm(100))
  
  observe({
    
    if( input$distribution == "normal" ){
      data$x <- rnorm( input$ex9_n, mean = input$ex9_mean, sd = input$ex9_sd )  
    } else {
      data$x <- runif( input$ex9_n, min = input$ex9_min, max = input$ex9_max )
    }
    
    
    
  })


  
  output$ex9_hist <- renderPlot({
    x <- data$x
    hist( x , col="purple", main = input$ex9_titre )
    rug( x )
  }, width = 600 )

}

shinyApp(ui,server)