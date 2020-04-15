
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("First name Popularity"),
  
  sidebarLayout(
    sidebarPanel(
      # textInput("name",label = "Type a firstname",value = "Vincent")
  checkboxGroupInput(inputId = "sexe",label = "gender selection",choices = c("Male" = "M", "Female" = "F"),selected = c("M","F")),
      selectInput("name",label = "choose a first name",
                  selected = "Vincent",choices = prenoms %>% distinct(name)  %>% pull(name)),
      selectInput("color",label = "choose a color",choices = palette()),
      sliderInput(inputId = "range",label = "choose a time range",value = c(1900,2017),min=1900,max=2017),
      actionButton(inputId = "go",label = "go",icon = icon("refresh"))
        ),
    
    mainPanel(
      textOutput("nb_of_birth"),
      plotOutput("plot_popularity"),
      DT::DTOutput("dataset")
    )
  )
)

server <- function(input, output) {
  
  
  

  
  
  data_name <- reactive({
    prenoms %>%
      filter(name == input$name) 
    
  })
  
  data_sexe <- reactive({
    data_name() %>% 
      filter(sex %in% input$sexe)
    
  })
  
  dataset <- eventReactive(input$go,{
    
    data_sexe() %>%
      group_by(year, name) %>%
      summarise(total = sum(n)) %>%
      ungroup() %>%
      complete(year = 1900:2017, name, fill = list(total = 0))
    
  })
  
  
  
  library(prenoms)
  library(tidyverse)
  data(prenoms)
  
  draw_a_name <- function(data,nom,color) {
      data %>%
      ggplot() +
      aes(x = year, y = total) +
      geom_line(color=color)
  }
  
  count_a_name <- function(nom){
    prenoms %>% 
      filter(name == nom) %>% 
      summarise(total = sum(n)) %>% 
      pull(total)
  }
  
  
  
  
  
  output$plot_popularity <- renderPlot({
    
    draw_a_name(data = dataset(),nom = isolate( input$name ), color= isolate(input$color) ) +
      coord_cartesian(xlim=isolate( input$range) )
  })
  
  output$nb_of_birth <- renderText({
    
    glue::glue("There were {count_a_name(input$name)} births of {input$name}")
  })
  
  output$dataset <- DT::renderDT({
    
     dataset()
    
  })
  
  
  observeEvent(input$sexe,{
    
    message("sex is changing")
    
  })
  
  observe({
    input$name
    input$range
    message("name or range is changing")
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

