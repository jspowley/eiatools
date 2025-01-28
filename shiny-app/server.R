server <- function(input, output) {

  observeEvent(input$submit_button, {
    api_key <- input$text_input
    print(api_key)
  })

  output$plot <- renderPlot({
    x <- rnorm(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)

    ggplot(data, aes(x = x, y = y)) +
      geom_point(color = "white", size = 2) +
      labs(title = "Coal Production", x = "Time", y = "Production") +
      theme(
        panel.background = element_rect(fill = "#202020"),
        panel.border = element_blank(),

        plot.background = element_rect(fill = "#202020"),
        plot.title = element_text(size = 14, color = "white", face = "bold"),

        panel.grid.major = element_line(color = "lightgrey", linetype = "dotted"),
        panel.grid.minor = element_line(color = "lightgrey", linetype = "dotted"),

        axis.line = element_line(color = "white"),
        axis.title.x = element_text(size = 12, color = "white"),
        axis.title.y = element_text(size = 12, color = "white"),
        axis.text = element_text(color = "white"),

        legend.title = element_text(size = 12, color = "white"),
        legend.text = element_text(size = 10, color = "white"),
        legend.position = "none"
      )
  })

  output$lineChart <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)

    ggplot(data, aes(x = x, y = y)) +
      geom_line(color = "white", size = 0.8) +
      labs(title = "Coal Production", x = "Time", y = "Production") +
      theme(
        panel.background = element_rect(fill = "#202020"),
        panel.border = element_blank(),

        plot.background = element_rect(fill = "#202020"),
        plot.title = element_text(size = 14, color = "white", face = "bold"),

        panel.grid.major = element_line(color = "lightgrey", linetype = "dotted"),
        panel.grid.minor = element_line(color = "lightgrey", linetype = "dotted"),

        axis.line = element_line(color = "white"),
        axis.title.x = element_text(size = 12, color = "white"),
        axis.title.y = element_text(size = 12, color = "white"),
        axis.text = element_text(color = "white"),

        legend.title = element_text(size = 12, color = "white"),
        legend.text = element_text(size = 10, color = "white"),
        legend.position = "none"
      )
  })

  output$AreaChart <- renderPlot({
    x <- seq_len(input$num_points)
    y <- cumsum(rnorm(input$num_points))
    data <- data.frame(x, y)

    ggplot(data, aes(x = x, y = y)) +
      geom_area(fill = "lightblue", alpha = 0.3) +
      geom_line(color = "white", size = 0.8) +
      labs(title = "Coal Production", x = "Time", y = "Production") +
      theme(
        panel.background = element_rect(fill = "#202020"),
        panel.border = element_blank(),

        plot.background = element_rect(fill = "#202020"),
        plot.title = element_text(size = 14, color = "white", face = "bold"),

        panel.grid.major = element_line(color = "lightgrey", linetype = "dotted"),
        panel.grid.minor = element_line(color = "lightgrey", linetype = "dotted"),

        axis.line = element_line(color = "white"),
        axis.title.x = element_text(size = 12, color = "white"),
        axis.title.y = element_text(size = 12, color = "white"),
        axis.text = element_text(color = "white"),

        legend.title = element_text(size = 12, color = "white"),
        legend.text = element_text(size = 10, color = "white"),
        legend.position = "none"
      )
  })

  output$html <- renderUI({
    HTML("<h3>Reports Content Goes Here</h3>")
  })

  output$market1 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)

    ggplot(data, aes(x = x, y = y)) +
      geom_area(fill = "lightblue", alpha = 0.3) +
      geom_line(color = "white", size = 0.8) +
      labs(title = "Coal Production", x = "Time", y = "Production") +
      theme(
        panel.background = element_rect(fill = "#202020"),
        panel.border = element_blank(),

        plot.background = element_rect(fill = "#202020"),
        plot.title = element_text(size = 14, color = "white", face = "bold"),

        panel.grid.major = element_line(color = "lightgrey", linetype = "dotted"),
        panel.grid.minor = element_line(color = "lightgrey", linetype = "dotted"),

        axis.line = element_line(color = "white"),
        axis.title.x = element_text(size = 12, color = "white"),
        axis.title.y = element_text(size = 12, color = "white"),
        axis.text = element_text(color = "white"),

        legend.title = element_text(size = 12, color = "white"),
        legend.text = element_text(size = 10, color = "white"),
        legend.position = "none"
      )
  })

  output$market2 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)

    ggplot(data, aes(x = x, y = y)) +
      geom_area(fill = "lightblue", alpha = 0.3) +
      geom_line(color = "white", size = 0.8) +
      labs(title = "Coal Production", x = "Time", y = "Production") +
      theme(
        panel.background = element_rect(fill = "#202020"),
        panel.border = element_blank(),

        plot.background = element_rect(fill = "#202020"),
        plot.title = element_text(size = 14, color = "white", face = "bold"),

        panel.grid.major = element_line(color = "lightgrey", linetype = "dotted"),
        panel.grid.minor = element_line(color = "lightgrey", linetype = "dotted"),

        axis.line = element_line(color = "white"),
        axis.title.x = element_text(size = 12, color = "white"),
        axis.title.y = element_text(size = 12, color = "white"),
        axis.text = element_text(color = "white"),

        legend.title = element_text(size = 12, color = "white"),
        legend.text = element_text(size = 10, color = "white"),
        legend.position = "none"
      )
  })

  output$market3 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)

    ggplot(data, aes(x = x, y = y)) +
      geom_area(fill = "lightblue", alpha = 0.3) +
      geom_line(color = "white", size = 0.8) +
      labs(title = "Coal Production", x = "Time", y = "Production") +
      theme(
        panel.background = element_rect(fill = "#202020"),
        panel.border = element_blank(),

        plot.background = element_rect(fill = "#202020"),
        plot.title = element_text(size = 14, color = "white", face = "bold"),

        panel.grid.major = element_line(color = "lightgrey", linetype = "dotted"),
        panel.grid.minor = element_line(color = "lightgrey", linetype = "dotted"),

        axis.line = element_line(color = "white"),
        axis.title.x = element_text(size = 12, color = "white"),
        axis.title.y = element_text(size = 12, color = "white"),
        axis.text = element_text(color = "white"),

        legend.title = element_text(size = 12, color = "white"),
        legend.text = element_text(size = 10, color = "white"),
        legend.position = "none"
      )
  })

  output$market4 <- renderPlot({
    x <- seq_len(input$num_points)
    y <- rnorm(input$num_points)
    data <- data.frame(x, y)

    ggplot(data, aes(x = x, y = y)) +
      geom_area(fill = "lightblue", alpha = 0.3) +
      geom_line(color = "white", size = 0.8) +
      labs(title = "Coal Production", x = "Time", y = "Production") +
      theme(
        panel.background = element_rect(fill = "#202020"),
        panel.border = element_blank(),

        plot.background = element_rect(fill = "#202020"),
        plot.title = element_text(size = 14, color = "white", face = "bold"),

        panel.grid.major = element_line(color = "lightgrey", linetype = "dotted"),
        panel.grid.minor = element_line(color = "lightgrey", linetype = "dotted"),

        axis.line = element_line(color = "white"),
        axis.title.x = element_text(size = 12, color = "white"),
        axis.title.y = element_text(size = 12, color = "white"),
        axis.text = element_text(color = "white"),

        legend.title = element_text(size = 12, color = "white"),
        legend.text = element_text(size = 10, color = "white"),
        legend.position = "none"
      )
  })
}
