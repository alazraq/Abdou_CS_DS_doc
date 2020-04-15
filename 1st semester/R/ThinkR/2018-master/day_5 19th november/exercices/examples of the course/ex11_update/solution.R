library(shiny)

ui <- fluidPage(
  tags$br(),
  tags$br(),
  tags$br(),
  tags$br(),
  actionButton("compteur",label = "0")
)

server <- function(input, output, session) {
  observeEvent(input$compteur,{
    updateActionButton(session = session,
                       inputId = "compteur",
                       label = input$compteur
                        )
    
  })
}

shinyApp(ui, server)