ui <- navbarPage(
  title = tags$div(
    tags$img(src = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Eia-logomark.svg/1200px-Eia-logomark.svg.png", height = "30px", style = "margin-right: 10px;"),
    style = "display: flex; align-items: center;"
  ),
  header = tags$head(
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
        font-family: 'Terminal', monospace;
      }
      .custom-class {
        margin-left: 20px;
        margin-right: 20px;
        font-family: 'Terminal', monospace;
      }
    "))
  ),
  
  tabPanel("Home",
           sidebarLayout(
             sidebarPanel(
               sliderInput("num_points", "Number of points:", min = 10, max = 100, value = 50),
               textInput("text_input", "Enter text:"),
               numericInput("num_input", "Numeric input:", value = 10),
               dateInput("date_input", "Select date:"),
               selectInput("select_input", "Choose option:", choices = c("Option 1", "Option 2", "Option 3")),
             ),
             mainPanel(
               tabsetPanel(
                 tabPanel("Scatter", plotOutput("plot")),
                 tabPanel("Line", plotOutput("lineChart")),
                 tabPanel("Area", plotOutput("AreaChart")),
                 tabPanel("Table", tableOutput("table")),
                 tabPanel("Reports", htmlOutput("html")),
               ),
               tags$div(class = "custom-class", "Source: eia.gov")
             )
           )
  ),
  
  tabPanel("About",
           fluidPage(
             h2("About Page"),
             p("This is the about page content.")
           )
  ),
  
  tabPanel("Contact",
           fluidPage(
             h2("Contact Page"),
             p("This is the contact page content.")
           )
  )
)
