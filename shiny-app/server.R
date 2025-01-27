server <- function(input, output) {
  
  output$plot <- renderPlot({
    x <- rnorm(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)
    
    ggplot(data, aes(x = x, y = y)) +
      geom_point(color = "blue") +
      labs(title = "Scatter Plot", x = "X-Axis", y = "Y-Axis") +
      theme_minimal()
  })
  
  output$lineChart <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)
    
    ggplot(data, aes(x = x, y = y)) +
      geom_line(color = "blue", size = 1.5) +
      labs(title = "Line Chart", x = "X-Axis", y = "Y-Axis") +
      theme_minimal()
  })
  
  output$AreaChart <- renderPlot({
    x <- seq_len(input$num_points)
    y <- cumsum(rnorm(input$num_points))
    data <- data.frame(x, y)
    
    ggplot(data, aes(x = x, y = y)) +
      geom_area(fill = "lightblue", alpha = 0.5) +
      geom_line(color = "blue", size = 1.5) +
      labs(title = "Area Chart", x = "X-Axis", y = "Y-Axis") +
      theme_minimal()
  })
  
  output$html <- renderUI({
    HTML("<h3>Reports Content Goes Here</h3>")
  })
  
  output$market1 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)
    
    ggplot(data, aes(x = x, y = y)) +
      geom_line(color = "blue", size = 1.5) +
      labs(title = "Petroleum Prices", x = "X-Axis", y = "Y-Axis") +
      theme_minimal()
  })
  
  output$market2 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)
    
    ggplot(data, aes(x = x, y = y)) +
      geom_line(color = "blue", size = 1.5) +
      labs(title = "Petroleum Production", x = "X-Axis", y = "Y-Axis") +
      theme_minimal()
  })
  
  output$market3 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)
    
    ggplot(data, aes(x = x, y = y)) +
      geom_line(color = "blue", size = 1.5) +
      labs(title = "Coal Prices", x = "X-Axis", y = "Y-Axis") +
      theme_minimal()
  })
  
  output$market4 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)
    
    ggplot(data, aes(x = x, y = y)) +
      geom_line(color = "blue", size = 1.5) +
      labs(title = "Coal Production", x = "X-Axis", y = "Y-Axis") +
      theme_minimal()
  })
}
