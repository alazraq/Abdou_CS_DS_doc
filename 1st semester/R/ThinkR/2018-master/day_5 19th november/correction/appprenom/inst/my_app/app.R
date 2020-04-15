
library(shiny)
library(appprenom)

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
  all_names <- prenoms %>% distinct(name) %>% arrange(name) %>% pull(name) # to be sure do the calcul only once

  callModule(app_prenom,"first", all_names= all_names)
  callModule(app_prenom,"second",all_names= all_names)
  callModule(app_prenom,"third", all_names= all_names)


}

# Run the application
shinyApp(ui = ui, server = server)

