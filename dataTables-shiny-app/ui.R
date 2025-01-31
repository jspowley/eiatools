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
             textInput("api_input", "ENTER API KEY:"),
             actionButton("api_button", "Submit")
           )
  ),

  tabPanel("DataTable",
           fillPage(
             actionButton("transfer_rows", "Transfer Selected Rows"),
             fillRow(
               fillCol(
                 h3("Source Table"),
                 DTOutput("source_table", width = "98%")
               ),
               fillCol(
                 h3("Target Table"),
                 DTOutput("target_table", width = "98%")
               )
             )
           )
  )
)
