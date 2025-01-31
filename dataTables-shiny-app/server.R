server <- function(input, output) {

  #------------------------------------Buttons-------------------------------#
  observeEvent(input$api_button, {
    api_key <- input$text_input
  }) ## API Submission Button

}
