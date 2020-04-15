library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput("ex10_titre", label = "title", value = "Histogram"),
      sliderInput("ex10_n", label = "size", min = 100, max= 1000, value = 500), 
      selectInput( "distribution", label = "distribution", choices = c("normal", "uniform"), selected = "normal" ),
      conditionalPanel( 'input.distribution == "normal" ',
                        fluidRow(
                          column(6, sliderInput("ex10_mean", "mean", value = 0, min=-5, max = 5)), 
                          column(6, sliderInput("ex10_sd", "sd", value = 1, min=0, max = 5))
                        )
      ),
      conditionalPanel( 'input.distribution == "uniform" ',
                        fluidRow(
                          column(6, sliderInput("ex10_min", "min", value = 0, min=-5, max = 5)), 
                          column(6, sliderInput("ex10_max", "max", value = 1, min=0, max = 5))
                        )
      )
    ), 
    mainPanel( 
      tabPanel("graphique", plotOutput("ex10_hist") )
      
    )
  )
)

server <- function(input, output) {
  
  
  data <-  reactive({
    showNotification(paste( "in reactive", Sys.time() ) )
    invalidateLater(1000)
    switch( input$distribution,
            normal = rnorm( input$ex10_n, mean = input$ex10_mean, sd = input$ex10_sd ),
            uniform = runif( input$ex10_n, min = input$ex10_min, max = input$ex10_max )
    )
    
  })
  
  
  
  output$ex10_hist <- renderPlot({
    x <- data()
    hist( x , col="purple", main = input$ex10_titre )
    rug( x )
  }, width = 600 )
  
}

shinyApp(ui,server)