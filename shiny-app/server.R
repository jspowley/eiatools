server <- function(input, output) {

  #------------------------------------Buttons-------------------------------#
  observeEvent(input$api_button, {
    api_key <- input$text_input
    print(api_key) ## TO BE REMOVED
  }) ## API Submission Button

  observeEvent(input$dropdown_source, {
    source_list_select <- input$dropdown_source
    category_list <- names(data_list[[source_list_select]])
  }) ## Source Selection Submission Dropdown

  observeEvent(input$dropdown_category, {
    category_list_select <- input$dropdown_category

  }) ## Category Selection Submission Dropdown


  observeEvent(input$report_button, {
    req(input$select_input)

    selected_link <- news_list$link[news_list$title == input$select_input]
    selected_link <- as.character(selected_link)
    report_content <- html_reader(selected_link)
    report_content <- as.character(report_content)

    output$report_content <- renderUI({
      tags$div(HTML(report_content))
    })
  }) ## HTML Reports Submission Button

  #------------------------------------Forms-------------------------------#
  observeEvent(input$send, {
    req(input$name, input$email, input$message)

    send.mail(
      from = input$email,
      to = c("bnboyko@ualberta.ca", "jpowley@ualberta.ca"),
      subject = paste("eia Contact Form Message from", input$name),
      body = input$message,
      smtp = list(
        host.name = "smtp.example.com",  # Replace with your SMTP server in future (hide credentials)
        port = 465,
        user.name = "your_username",
        passwd = "your_password",
        ssl = TRUE
      ),
      authenticate = TRUE,
      send = TRUE
    )

    output$status <- renderText("Message sent successfully!")
  }) ## Contact Form

  #------------------------------------Charts-------------------------------#

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
  }) ## Data Visualization - Scatterplot

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
  }) ## Data Visualization - Line Chart

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
  }) ## Data Visualization - Area Chart

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
  }) ## Key Markets Graph 1 (Left to Right) - Area Chart

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
  }) ## Key Markets Graph 2 (Left to Right) - Area Chart

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
  }) ## Key Markets Graph 3 (Left to Right) - Area Chart

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
  }) ## Key Markets Graph 4 (Left to Right) - Area Chart
}
