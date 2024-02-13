library(shiny)
library(ggplot2)
library(dplyr)

# Define server logic
server <- function(input, output) {
  
  # Precompute filtered data once
  filtered_data <- reactive({
    df_filtered <- df[df$state_name == input$state, ]
    return(df_filtered)
  })
  
  # Render population plot
  output$populationPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = name_of_city, y = population_total)) +
      geom_bar(stat = "identity", fill = "blue") +
      labs(x = "City", y = "Population", title = "Population of Cities") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
  })
  
  # Render selected plot based on plotType input
  output$selectedPlot <- renderPlot({
    df_filtered <- filtered_data()
    
    if (input$plotType == "Population Plot") {
      # Use precomputed data for population plot
      ggplot(df_filtered, aes(x = name_of_city, y = population_total)) +
        geom_bar(stat = "identity", fill = "blue") +
        labs(x = "City", y = "Population", title = "Population of Cities") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    } else if (input$plotType == "Pie Chart") {
      # Use precomputed data for pie chart
      city_summary <- aggregate(population_total ~ name_of_city, data = df_filtered, FUN = sum)
      ggplot(city_summary, aes(x = "", y = population_total, fill = name_of_city)) +
        geom_bar(width = 1, stat = "identity") +
        coord_polar(theta = "y") +
        labs(fill = "City") +
        theme_void() +
        theme(legend.position = "right") +
        guides(fill = guide_legend(title = "City"))
    } else if (input$plotType == "Bubble Plot") {
      # Use precomputed data for bubble plot
      ggplot(df_filtered, aes(x = name_of_city, y = population_total, size = total_graduates)) +
        geom_point(color = "green", alpha = 0.6) +
        labs(x = "City", y = "Population", title = "Population of Cities wrt Graduates (Bubble Plot)") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    } else if (input$plotType == "Circular Plot") {
      # Use precomputed data for circular plot
      ggplot(df_filtered, aes(x = name_of_city, y = population_total, fill = name_of_city)) +
        geom_bar(stat = "identity") +
        coord_polar(theta = "y") +
        labs(x = NULL, y = NULL, title = "Population of Cities (Circular Barplot)") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
    } else if (input$plotType == "Male Population Plot") {
      # Use precomputed data for male population plot
      ggplot(df_filtered, aes(x = name_of_city, y = population_male)) +
        geom_bar(stat = "identity", fill = "skyblue") +
        labs(x = "City", y = "Population", title = "Population of Cities") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    }
  })
}


