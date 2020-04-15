library(shiny)

ui <- fluidPage(
  tags$br(),
  tags$br(),
  tags$br(),
  tags$br(),
  actionButton("compteur",label = "0")
)

server <- function(input, output, session) {

}

shinyApp(ui, server)