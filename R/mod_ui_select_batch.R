#' ui_select_batch UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_ui_select_batch_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' ui_select_batch Server Functions
#'
#' @noRd 
mod_ui_select_batch_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_ui_select_batch_ui("ui_select_batch_ui_1")
    
## To be copied in the server
# mod_ui_select_batch_server("ui_select_batch_ui_1")
