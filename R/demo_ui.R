library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(plotly)

ShinyQuickStarter::shinyQuickStarter()

ui <- dashboardPage(
  dashboardHeader(
    title = "foodchain",
    dropdownMenu(messageItem(
      from = "from",
      message = "message",
      icon = icon("user")
    ))
  ),
  dashboardSidebar(sidebarMenu(
    menuItem(
      tabName = "ui_tab1",
      text = "Honey Source",
      icon = icon("archive")
    ),
    menuItem(
      tabName = "ui_tab2",
      text = "tab2"
    )
  )),
  dashboardBody(tabItems(tabItem(
    tabName = "ui_tab1",
    wellPanel(
      searchInput(
        inputId = "batch_number_input",
        label = "Batch Number",
        placeholder = "Enter Batch Number"
      ),
      dateRangeInput(
        inputId = "ui_226690085526259",
        label = "Expiration Date Range",
        start = "2020-01-01"
      ),
      dateInput(
        inputId = "ui_705791643347758",
        label = "Date",
        daysofweekdisabled = c()
      ),
      pickerInput(
        inputId = "ui_460946083193672",
        label = "Select Apiary",
        choices = c(
          "a",
          "b",
          "c"
        ),
        selected = c("example"),
        multiple = TRUE,
        inline = TRUE
      )
    ),
    tabsetPanel(tabPanel(
      title = "Hive to Jar view",
      plotlyOutput(
        outputId = "ui_timeline",
        height = "100px"
      )
    )),
    tabsetPanel(tabPanel(
      title = "From Source to Store",
      plotlyOutput(outputId = "ui_sankey")
    ))
  )))
)

server <- shinyServer(function(input, output, session) {
  output$uppercase <- renderText({
    toupper(input$message)
  })
})

shinyApp(ui,server)
