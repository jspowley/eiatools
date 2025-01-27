ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      body {
        background-color: #f0f8ff;
      }
      .header-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-left: 20px;
        margin-right: 20px;
      }
      .header-title {
        flex-grow: 1;
      }
    "))
  ),
  
  fluidRow(
    div(class = "header-container",
        h1(class = "header-title", "eia Tools"),
        tags$img(src = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Eia-logomark.svg/1200px-Eia-logomark.svg.png", height = "50px")
    )
  ),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("num_points", "Number of points:", min = 10, max = 100, value = 50),
      textInput("text_input", "Enter text:"),
      numericInput("num_input", "Numeric input:", value = 10),
      dateInput("date_input", "Select date:"),
      selectInput("select_input", "Choose option:", choices = c("Option 1", "Option 2", "Option 3")),
      checkboxInput("checkbox_input", "Check me out!"),
      actionButton("action_button", "Click Me!")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("plot")),
        tabPanel("Table", tableOutput("table")),
        tabPanel("Text", verbatimTextOutput("text")),
        tabPanel("HTML", htmlOutput("html")),
      ),
      tags$div(class = "custom-class", "This is a custom styled div.")
    )
  )
)
