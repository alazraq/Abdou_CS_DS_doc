
library(shiny)

app_prenomUI <- function(id){
  
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        checkboxGroupInput(inputId = ns("sexe"),label = "gender selection",choices = c("Male" = "M", "Female" = "F"),selected = c("M","F")),
        selectInput(ns("name"),label = "choose a first name",  selected = "Vincent",choices = NULL),
        selectInput(ns("color"),label = "choose a color",choices = palette()),
        sliderInput(inputId = ns("range"),label = "choose a time range",value = c(1900,2017),min=1900,max=2017),
        actionButton(inputId = ns("go"),label = "go",icon = icon("refresh"))
      ),
      
      mainPanel(
        textOutput(ns("nb_of_birth")),
        tabsetPanel(
          tabPanel(title = "Graph",
                   plotOutput(ns("plot_popularity"))
          ),
          tabPanel(title = "Data",
                   DT::DTOutput(ns("dataset"))
          )
          
          
        )
        
      )
    )
    
    
  )
}
  

    
app_prenom <- function(input, output,session,all_names){
  
  
  # this 2 functions should be in a package !
  draw_a_name <- function(data,nom,color) {
    data %>%
      ggplot() +
      aes(x = year, y = total) +
      geom_line(color=color)
  }
  
  count_a_name <- function(data){
    data %>% 
      summarise(total = sum(total)) %>%
      pull(total)
  }
  
  
  
  
  data_name <- reactive({
    req(input$name)
    prenoms %>%
      filter(name == input$name) 
    
  })
  
  data_sexe <- reactive({
    req(data_name())
    data_name() %>% 
      filter(sex %in% input$sexe)
    
  })
  
  data_count <- reactive({
    req(data_sexe())
    data_sexe() %>%
      group_by(year, name) %>%
      summarise(total = sum(n)) %>% 
      ungroup()
    
  })
  
  dataset <- eventReactive(input$go,{
    req(data_count())
    data_count() %>%
      complete(year = 1900:2017, name, fill = list(total = 0))
  })
  
  
  
  output$plot_popularity <- renderPlot({
    req(dataset())
    draw_a_name(data = dataset(),nom = isolate( input$name ), color= isolate(input$color) ) +
      coord_cartesian(xlim=isolate( input$range) )
  })
  
  output$nb_of_birth <- renderText({
    req(data_count())
    req(input$name)
    glue::glue("There were {count_a_name(data=data_count())} births of {isolate(input$name)}")
  })
  
  output$dataset <- DT::renderDT({
    req(dataset())
    dataset()
    
  })
  
  
  observeEvent(input$sexe,{
    
    message("sex is changing")
    
  })
  
  observe({
    input$name
    input$range
    message("name or range is chaning")
    
  })
  
  observe({
    message("coucou")
    #delay calculation
    updateSelectizeInput(session = session,
                      inputId = "name",selected = "Vincent",
                      # choices = prenoms %>% distinct(name) %>% arrange(name) %>% pull(name)
                      choices = all_names,server=TRUE
                      )
    
  })
  
}


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("First name Popularity"),
  
   app_prenomUI("first"),
   app_prenomUI("second"),
   app_prenomUI("third")
)

server <- function(input, output,session) {
  
  library(prenoms)
  library(tidyverse)
  data(prenoms)
  all_names <- prenoms_france %>% distinct(name) %>% arrange(name) %>% pull(name) # to be sure do the calcul only once
  
  callModule(app_prenom,"first", all_names= all_names)
  callModule(app_prenom,"second",all_names= all_names)
  callModule(app_prenom,"third", all_names= all_names)
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)

