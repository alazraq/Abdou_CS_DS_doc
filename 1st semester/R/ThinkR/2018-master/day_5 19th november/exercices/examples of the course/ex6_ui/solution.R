library(shiny)

ui <- fluidPage(
  sidebarLayout( 
    sidebarPanel(
      textInput( "input_text", "some text"),
      textAreaInput( "input_textarea", "more text", height = 200),
      sliderInput( "input_slider", "slider", min = 0, max = 100, value = 42, step = 1)    
    ), 
    mainPanel(
      h1( "title level 1"), 
      "lorem ipsum", 
      fluidRow(
        column(6, numericInput("input_num1", "number 1", value= 10)), 
        column(6, numericInput("input_num2", "number 2", value= 20))
      ),
      h2( "titre niveau 2"), 
      fluidRow(
        column(3, numericInput("input_num3", "number 3", value= 10)), 
        column(3, numericInput("input_num4", "number 4", value= 20)), 
        column(3, numericInput("input_num5", "number 5", value= 10)), 
        column(3, numericInput("input_num6", "number 6", value= 20))
      )
    )
  )
)

server <- function(input, output) {}
shinyApp(ui = ui, server = server)
