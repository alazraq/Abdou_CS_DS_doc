library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput("ex2_titre", label = "tile", value = "Histogram"),
      sliderInput("ex2_n", label = "size", min = 100, max= 1000, value = 500)
    ), 
    mainPanel( 
      plotOutput("ex2_hist")
    )
  )
)
server <- function(input, output) {
  
  output$ex2_hist <- renderPlot({
    n <- input$ex2_n
    
    x <- rnorm(n)
    hist( x, col="purple", main = isolate(input$ex2_titre))
    rug( x )
    
  }, width = 600 )
  
}

shinyApp(ui = ui, server = server)