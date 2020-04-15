library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput("ex1_titre", label = "title", value = "My histogram"), 
      sliderInput("ex1_n", label = "size", min = 10, max= 100, value = 50)
    ), 
    mainPanel( 
      plotOutput( "ex1_hist"), 
      textOutput("ex1_text")
    )
  )
)
server <- function(input, output) {
  
  output$ex1_hist <- renderPlot({
    titre <- input$ex1_titre
    
    x <- rnorm(input$ex1_n)
    hist( x, main = titre, col="purple")
    rug( x )
    abline( v = mean(x), lwd = 4, col = "red")
    
  }, width = 600)
  
  output$ex1_text <- renderText({
    x <- rnorm(input$ex1_n)
    paste( "mean = ", mean(x) )
  })
}

shinyApp(ui = ui, server = server)