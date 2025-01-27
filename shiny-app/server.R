server <- function(input, output) {
  output$plot <- renderPlot({
    x <- rnorm(input$num_points)
    y <- rnorm(input$num_points)
    plot(x, y)
  })
  
  output$lineChart <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    plot(x, y, type = "l", col = "blue", lwd = 2,
         xlab = "X-Axis", ylab = "Y-Axis", main = "Line Chart")
  })
  
  output$AreaChart <- renderPlot({
    x <- seq_len(input$num_points)
    y <- cumsum(rnorm(input$num_points))
    plot(x, y, type = "n", xlab = "X-Axis", ylab = "Y-Axis", main = "Area Chart")
    polygon(c(x, rev(x)), c(y, rep(0, input$num_points)), col = "lightblue", border = NA)
    lines(x, y, col = "blue", lwd = 2)
  })
  
  output$html <- renderUI({
    HTML("<h3>Reports Content Goes Here</h3>")
  })
  
  output$market1 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    plot(x, y, type = "l", col = "blue", lwd = 2,
         xlab = "X-Axis", ylab = "Y-Axis", main = "Petroleum Prices")
  })
  
  output$market2 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    plot(x, y, type = "l", col = "blue", lwd = 2,
         xlab = "X-Axis", ylab = "Y-Axis", main = "Petroleum Production")
  })
  
  output$market3 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    plot(x, y, type = "l", col = "blue", lwd = 2,
         xlab = "X-Axis", ylab = "Y-Axis", main = "Coal Prices")
  })
  
  output$market4 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    plot(x, y, type = "l", col = "blue", lwd = 2,
         xlab = "X-Axis", ylab = "Y-Axis", main = "Coal Production")
  })
}
