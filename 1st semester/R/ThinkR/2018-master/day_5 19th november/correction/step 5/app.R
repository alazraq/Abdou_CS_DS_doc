
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   titlePanel("First name Popularity"),
   
   sidebarLayout(
      sidebarPanel(
        # textInput("name",label = "Type a firstname",value = "Vincent")
        selectInput("name",label = "choose a first name",
                    selected = "Vincent",choices = prenoms %>% distinct(name) %>% pull(name)),
        selectInput("color",label = "choose a color",choices = palette()),
        sliderInput(inputId = "range",label = "choose a time range",value = c(1900,2017),min=1900,max=2017)
      ),
      
      mainPanel(
        textOutput("nb_of_birth"),
         plotOutput("plot_popularity")
      )
   )
)

server <- function(input, output) {

  
  
  
  
  library(prenoms)
  library(tidyverse)
  data(prenoms)
  
  draw_a_name <- function(nom,color) {
    prenoms %>%
      filter(name == nom) %>%
      group_by(year, name) %>%
      summarise(total = sum(n)) %>%
      ungroup() %>%
      complete(year = 1900:2017, name, fill = list(total = 0)) %>%
      # replace_na(list(total = 0)) %>%
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

     draw_a_name(nom = input$name, color=input$color) +
       coord_cartesian(xlim=input$range)
     
   })
   
   output$nb_of_birth <- renderText({
     
     glue::glue("There were {count_a_name(input$name)} births of {input$name}")
   })
   
}

# Run the application 
shinyApp(ui = ui, server = server)

