#' plot_delete UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_plot_delete_ui <- function(id){
  ns <- NS(id)
  tagList(
 h2("Dev_test"),
 plotOutput(ns("plot_delete"))
  )
}
    
#' plot_delete Server Functions
#'
#' @noRd 
mod_plot_delete_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$plot_delete <- renderPlot({
      plot(iris)
    })
 
  })
}
    
## To be copied in the UI
# mod_plot_delete_ui("plot_delete_ui_1")
    
## To be copied in the server
# mod_plot_delete_server("plot_delete_ui_1")
