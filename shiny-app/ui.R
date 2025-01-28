ui <- navbarPage(
  title = tags$div(
    tags$img(src = "https://github.com/jspowley/eiatools/raw/refs/heads/main1/design/DarkMode%20Logo.png", height = "40px", style = "margin-right: 10px;"),
    "",
    style = "display: flex; align-items: center;"
  ),
  header = tags$head(
    tags$style(HTML("
      body {
        background-color: #202020;
        color: white;
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
      .navbar {
        background-color: #202020 !important;
      }
      .navbar-header {
        background-color: #202020 !important;
      }
      h1, h2, h3, h4, h5, h6, p, li, a {
        color: white !important;
      }
      .navbar-nav > .active > a,
      .navbar-nav > .active > a:focus,
      .navbar-nav > .active > a:hover {
        background-color: #000000 !important;
        color: #ffffff !important;
      }
      /* Change hover color for tabs */
      .navbar-nav > li > a:hover {
        background-color: #000000 !important;
        color: #ffffff !important;
      }
    "))
  ),

  tabPanel("Settings",
           fluidPage(
             h2("User Settings"),
             textInput("text_input", "ENTER API KEY:"),
             actionButton("submit_button", "Submit")
           )
  ),

  tabPanel("Markets",
           fluidPage(
             h2("Key Markets"),
             fluidRow(
               column(6, plotOutput("market1")),
               column(6, plotOutput("market2"))
             ),
             fluidRow(
               column(6, plotOutput("market3")),
               column(6, plotOutput("market4"))
             )
           )
  ),

  tabPanel("Data Visualization",
           sidebarLayout(
             sidebarPanel(
               sliderInput("num_points", "Number of points:", min = 10, max = 100, value = 50),
               textInput("text_input", "Enter text:"),
               numericInput("num_input", "Numeric input:", value = 10),
               dateInput("date_input", "Select date:"),
               selectInput("select_input", "Choose option:", choices = c("Option 1", "Option 2", "Option 3"))
             ),
             mainPanel(
               tabsetPanel(
                 tabPanel("Scatter", plotOutput("plot")),
                 tabPanel("Line", plotOutput("lineChart")),
                 tabPanel("Area", plotOutput("AreaChart")),
                 tabPanel("Table", tableOutput("table"))
               ),
               tags$div(class = "custom-class", "Source: eia.gov")
             )
           )
  ),

  tabPanel("Models",
           fluidPage(
             h2("Models Page"),
             p("This is the models page content.")
           )
  ),

  tabPanel("Reports",
           fluidPage(
             h2("Reports Page"),
             p("This is the reports page content.")
           )
  ),

  tabPanel("Contact",
           fluidPage(
             h2("Contact Page"),
             p("This is the contact page content.")
           )
  )
)
