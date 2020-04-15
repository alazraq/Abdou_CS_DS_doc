library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput("ex7_titre", label = "title", value = "Histogram"),
      sliderInput("ex7_n", label = "size", min = 100, max= 1000, value = 500), 
      fluidRow(
        column(6, sliderInput("ex7_mean", "mean", value = 0, min=-5, max = 5)), 
        column(6, sliderInput("ex7_sd", "sd", value = 1, min=0, max = 5))
      ), 
      actionButton( "ex7_go", "Go")
      
    ), 
    mainPanel( 
      plotOutput("ex7_hist")
    )
  )
)
server <- function(input, output) {
  
  # data <- reactiveValues(x=rnorm(100))
  data <- reactiveValues(x=rnorm(100),y=NULL)
  
  observeEvent(input$ex7_go, {
    message("go")
    data$x <- rnorm( input$ex7_n, mean = input$ex7_mean, sd = input$ex7_sd )
  })
  
  output$ex7_hist <- renderPlot({
    x <- data$x
    hist( x , col="purple", main = input$ex7_titre )
    rug( x )
    
  }, width = 600 )
  
  observeEvent(input$ex7_mean,{
    message("mean change")
      })
  
  observe({
    input$ex7_n
    input$ex7_sd
    message("size or sd change")
      })
  
}

shinyApp(ui,server)