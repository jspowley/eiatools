ui <- navbarPage(

  #------------------------------------General UI-------------------------------#
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
      .navbar-nav > li > a:hover {
        background-color: #000000 !important;
        color: #ffffff !important;
      }
    "))
  ),

  #------------------------------------Selected Pages-------------------------------#
  tabPanel("Settings",
           fluidPage(
             h2("User Settings"),
             textInput("text_input", "ENTER API KEY:"),
             actionButton("api_button", "Submit")
           )
  ),

  tabPanel("Markets",
           fluidPage(
             tags$style(HTML("
                .selectize-input {
                  background-color: #202020 !important;
                  color: white !important;
              }
              .selectize-dropdown {
                background-color: #202020 !important;
                color: white !important;
              }
  ")),
             fluidRow(
               column(3,
                      selectizeInput(inputId = "dropdown",label = "Select a series", choices = c("Option 1", "Option 2", "Option 3", "Option 4"), selected = NULL, multiple = FALSE, options = list(placeholder = "Type to search...", maxItems = 1)),
                      plotOutput("market1"),
                      tags$div(class = "custom-class", "Source: eia.gov")
                      ),

               column(3,
                      selectizeInput(inputId = "dropdown",label = "Select a series", choices = c("Option 1", "Option 2", "Option 3", "Option 4"), selected = NULL, multiple = FALSE, options = list(placeholder = "Type to search...", maxItems = 1)),
                      plotOutput("market2"),
                      tags$div(class = "custom-class", "Source: eia.gov")
               ),

               column(3,
                      selectizeInput(inputId = "dropdown",label = "Select a series", choices = c("Option 1", "Option 2", "Option 3", "Option 4"), selected = NULL, multiple = FALSE, options = list(placeholder = "Type to search...", maxItems = 1)),
                      plotOutput("market3"),
                      tags$div(class = "custom-class", "Source: eia.gov")
               ),
               column(3,
                      selectizeInput(inputId = "dropdown",label = "Select a series", choices = c("Option 1", "Option 2", "Option 3", "Option 4"), selected = NULL, multiple = FALSE, options = list(placeholder = "Type to search...", maxItems = 1)),
                      plotOutput("market4"),
                      tags$div(class = "custom-class", "Source: eia.gov")
               ) ## The Idea Is To Store These Selections In a .txt file, which allows users to save their default series ids
             )
           )
  ),

  tabPanel("Data Visualization",
           sidebarLayout(
             sidebarPanel(
               sliderInput("num_points", "Number of points:", min = 10, max = 100, value = 50),
               dateInput("date_input_start", "Select Start Date:"),
               dateInput("date_input_end", "Select End Date:"),
               selectizeInput(inputId = "dropdown_source",label = "Select a Source", choices = source_list, selected = NULL, multiple = FALSE, options = list(placeholder = "Type to search...", maxItems = 1)),
               selectizeInput(inputId = "dropdown_category",label = "Select a Category", choices = c("Option 1", "Option 2", "Option 3", "Option 4"), selected = NULL, multiple = FALSE, options = list(placeholder = "Type to search...", maxItems = 1)),
               selectizeInput(inputId = "dropdown_series",label = "Select a Series", choices = c("Option 1", "Option 2", "Option 3", "Option 4"), selected = NULL, multiple = FALSE, options = list(placeholder = "Type to search...", maxItems = 1)),
               selectizeInput(inputId = "dropdown_tool",label = "Select a Tool", choices = tools_list, selected = NULL, multiple = FALSE, options = list(placeholder = "Type to search...", maxItems = 1)),
               actionButton("data_vis_submit", "Generate Visualization")
             ),
             mainPanel(
               tabsetPanel(
                 tabPanel("Scatter", plotOutput("plot")),
                 tabPanel("Line", plotOutput("lineChart")),
                 tabPanel("Area", plotOutput("AreaChart")),
                 tabPanel("Table", tableOutput("table"))
               ),
               tags$div(class = "custom-class", "Source: eia.gov"),
               actionButton("csv_button", "Download CSV"),
               actionButton("r_button", "Download API"),
               actionButton("image_button", "Download PNG")
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
           sidebarLayout(
             sidebarPanel(
               selectInput("select_input", "Choose Report", choices = news_list$title),
               actionButton("report_button", "Submit")
             ),
             mainPanel(
               uiOutput("report_content"),
               tags$div(class = "custom-class", "Source: eia.gov/todayinenergy")
             )
           )
  ),
  tabPanel("Developer",
           sidebarLayout(
             sidebarPanel(
               selectizeInput(inputId = "dropdown_source",label = "Select a Source", choices = c("Option 1", "Option 2", "Option 3", "Option 4"), selected = NULL, multiple = FALSE, options = list(placeholder = "Type to search...", maxItems = 1)),
               selectizeInput(inputId = "dropdown_category",label = "Select a Category", choices = c("Option 1", "Option 2", "Option 3", "Option 4"), selected = NULL, multiple = FALSE, options = list(placeholder = "Type to search...", maxItems = 1)),
               selectizeInput(inputId = "dropdown_series",label = "Select a Series", choices = c("Option 1", "Option 2", "Option 3", "Option 4"), selected = NULL, multiple = FALSE, options = list(placeholder = "Type to search...", maxItems = 1)),
               actionButton("dev_button", "Generate")
             ),
             mainPanel(
               tabsetPanel(
                 tabPanel("JSON", verbatimTextOutput("json_text")),
                 tabPanel("Options", tableOutput("table")),
                 tabPanel("R", plotOutput("table")),
                 tabPanel("Python", tableOutput("table"))
               ),
               tags$div(class = "custom-class", "Source: eia.gov")
             )
           )
  ),

  tabPanel("Contact",
           fluidPage(
             tags$style(HTML("
              .form-control {
                background-color: #202020;
                color: white;
              }
              .well {
                background-color: #202020;
                border-color: #202020;
              }
           ")),  # Corrected placement of closing parenthesis and quote
             h2("Contact Us"),
             p("If you encounter any bugs, errors, or unexpected behavior while using our app, please let us know so we can address them as quickly as possible. We also welcome suggestions for improvements, new features, or any feedback that can help make your experience better. Whether it’s a minor inconvenience or a major idea you’d like to see implemented, we value your input. Feel free to reach out for any technical issues, general inquiries, or feedback—it’s your insights that drive our continued development!"),
             sidebarLayout(
               sidebarPanel(
                 textInput("name", "Name:"),
                 textInput("email", "Email:"),
                 textAreaInput("message", "Message:", "", rows = 5),
                 actionButton("send", "Send Message")
               ),
               mainPanel(
                 textOutput("status")
               )
             )
           )
  )

)


