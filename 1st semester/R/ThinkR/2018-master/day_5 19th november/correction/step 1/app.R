
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   titlePanel("First name Popularity"),
   
   sidebarLayout(
      sidebarPanel(
textInput("name",label = "Type a firstname")
      ),
      
      mainPanel(
        
         plotOutput("plot_popularity")
      )
   )
)

server <- function(input, output) {

  
  
  
  
  library(prenoms)
  library(tidyverse)
  data(prenoms)
  
  draw_a_name <- function(nom) {
    prenoms %>%
      filter(name == nom) %>%
      group_by(year, name) %>%
      summarise(total = sum(n)) %>%
      ungroup() %>%
      complete(year = 1900:2017, name, fill = list(total = 0)) %>%
      # replace_na(list(total = 0)) %>%
      ggplot() +
      aes(x = year, y = total) +
      geom_line()
  }
  
  count_a_name <- function(nom){
    prenoms %>% 
      filter(name == nom) %>% 
      summarise(total = sum(n)) %>% 
      pull(total)
  }
  
  
  
  
     
   output$plot_popularity <- renderPlot({

     draw_a_name(nom = input$name)
     
     
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

