
library(shiny)
library(DT)


data1 <- mtcars[1:10, ]
data2 <- data.frame()

ui <- fluidPage(
  titlePanel("Move Rows Between Tables Using Checkboxes"),

  sidebarLayout(
    sidebarPanel(
      actionButton("transfer_rows", "Transfer Selected Rows")
    ),
    mainPanel(
      h3("Source Table"),
      DTOutput("source_table"),

      h3("Target Table"),
      DTOutput("target_table")
    )
  )
)


server <- function(input, output, session) {
  rv <- reactiveValues(
    source_data = data1,
    target_data = data2
  )

  output$source_table <- renderDT({
    datatable(
      rv$source_data,
      selection = "multiple"
    )
  })

  output$target_table <- renderDT({
    datatable(rv$target_data)
  })

  observeEvent(input$transfer_rows, {
    selected_rows <- input$source_table_rows_selected

    if (!is.null(selected_rows) && length(selected_rows) > 0) {
      rows_to_add <- rv$source_data[selected_rows, ]
      rv$target_data <- rbind(rv$target_data, rows_to_add)

      rv$source_data <- rv$source_data[-selected_rows, ]
    }
  })
}


shinyApp(ui = ui, server = server)
