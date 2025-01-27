library(shiny) # To Be Removed

ui <- fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("num_points",        # Define a slider input
                  "Number of points:", # Label for the slider
                  min = 10,            # Minimum value for the slider
                  max = 100,           # Maximum value for the slider
                  value = 50)          # Default value for the slider
    ),
    mainPanel(
      plotOutput("plot")               # Display area for the plot
    )
  )
)
