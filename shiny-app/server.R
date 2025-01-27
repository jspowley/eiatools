library(shiny) # To Be Removed

server <- function(input, output) {
  output$plot <- renderPlot({              # Render a plot based on user input
    x <- rnorm(input$num_points)         # Generate 'num_points' random values for x-axis
    y <- rnorm(input$num_points)         # Generate 'num_points' random values for y-axis
    plot(x, y)                           # Create a scatter plot using x and y
  })
}

  