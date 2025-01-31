server <- function(input, output) {

  #------------------------------------Buttons-------------------------------#
  observeEvent(input$api_button, {
    api_key <- input$api_input
    print(api_key)
  }) ## API Submission Button

  rv <- reactiveValues(
    source_data = data_main,
    target_data = data_user
  )

  output$source_table <- renderDT({
    datatable(
      rv$source_data,
      selection = "multiple",
      options = list(scrollX = TRUE, scrollY = '50%')
    )
  })

  output$target_table <- renderDT({
    datatable(rv$target_data,
              options = list(scrollX = TRUE, scrollY = '50%')
              )
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
