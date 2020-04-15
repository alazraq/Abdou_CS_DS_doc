#' app_prenomUI
#'
#' @param id shiny id
#' @import shiny
#' @importFrom  DT renderDT DTOutput
#' @importFrom grDevices palette
#' @export

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



#' app_prenom
#'
#' @param input internal
#' @param output internal
#' @param session internal
#' @param all_names vector of name to display
#'
#' @export
#' @rdname app_prenomUI
#' @importFrom glue glue
#' @import dplyr
app_prenom <- function(input, output,session,all_names){


  data_name <- reactive({
    req(input$name)
    prenoms %>%
      filter(name == input$name)

  })

  data_sexe <- reactive({
    req(data_name())
    data_name() %>%
      dplyr::filter(sex %in% input$sexe)

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
    #delay calculation
    updateSelectizeInput(session = session,
                      inputId = "name",selected = "Vincent",
                      # choices = prenoms %>% distinct(name) %>% arrange(name) %>% pull(name)
                      choices = all_names,server = TRUE
    )

  })

}

