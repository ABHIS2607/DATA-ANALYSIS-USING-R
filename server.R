# Define server logic
server <- function(input, output) {
  
  # Precompute filtered data once
  filtered_data <- reactive({
    df_filtered <- df[df$state_name == input$state, ]
    return(df_filtered)
  })
  
  # Render selected plot based on plotType input
  output$selectedPlot <- renderPlot({
    df_filtered <- filtered_data()
    
    if (input$plotType == "Population Plot") {
      # Population plot
      ggplot(df_filtered, aes(x = name_of_city, y = population_total)) +
        geom_bar(stat = "identity", fill = "blue") +
        labs(x = "City", y = "Population", title = "Population of Cities") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
      
    } else if (input$plotType == "Pie Chart") {
      # Pie chart
      city_summary <- aggregate(population_total ~ name_of_city, data = df_filtered, FUN = sum)
      ggplot(city_summary, aes(x = "", y = population_total, fill = name_of_city)) +
        geom_bar(width = 1, stat = "identity") +
        coord_polar(theta = "y") +
        labs(fill = "City") +
        theme_void() +
        theme(legend.position = "right") +
        guides(fill = guide_legend(title = "City"))
      
    } else if (input$plotType == "Bubble Plot") {
      # Bubble plot for Education
      ggplot(df_filtered, aes(x = name_of_city, y = total_graduates, size = total_graduates)) +
        geom_point(color = "red", alpha = 0.6) +
        labs(x = "City", y = "Population", title = "Education of Cities (Bubble Plot)") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
      
    } else if (input$plotType == "Circular Plot") {
      # Circular plot
      ggplot(df_filtered, aes(x = name_of_city, y = population_total, fill = name_of_city)) +
        geom_bar(stat = "identity") +
        coord_polar(theta = "y") +
        labs(x = NULL, y = NULL, title = "Population of Cities (Circular Barplot)") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
      
    } else if (input$plotType == "Male Population Plot") {
      # Male population plot
      ggplot(df_filtered, aes(x = name_of_city, y = male_graduates)) +
        geom_bar(stat = "identity", fill = "skyblue") +
        labs(x = "City", y = "Graduates", title = "Graduates in Cities") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
      
    } else if (input$plotType == "Literacy Plot") {
      # Literacy plot
      ggplot(df_filtered, aes(x = name_of_city, y = effective_literacy_rate_total)) +
        geom_bar(stat = "identity", fill = "red") +
        labs(x = "City", y = "Population", title = "Population of Cities") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
      
    } else if (input$plotType == "Male Literacy Plot") {
      # Male literacy plot
      ggplot(df_filtered, aes(x = name_of_city, y = effective_literacy_rate_male)) +
        geom_bar(stat = "identity", fill = "blue") +
        labs(x = "City", y = "Literacy Rate", title = "Population of Cities") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
      
    } else if (input$plotType == "Female Literacy Plot") {
      # Female literacy plot
      ggplot(df_filtered, aes(x = name_of_city, y = effective_literacy_rate_female)) +
        geom_bar(stat = "identity", fill = "pink") +
        labs(x = "City", y = "Literacy Rate", title = "Literacy rates") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
      
    } else if (input$plotType == "Gender Literacy Plot") {
      # Gender literacy plot
      males <- sum(df_filtered$effective_literacy_rate_male) / nrow(df_filtered)
      females <- sum(df_filtered$effective_literacy_rate_female) / nrow(df_filtered)
      maleFemaledf <- data.frame(Gender = c("Females", "Males"),
                                 effective_literacy_rate = c(females, males))
      ggplot(maleFemaledf, aes(x = Gender, y = effective_literacy_rate, fill = Gender)) +
        geom_bar(stat = "identity") +
        labs(x = "Gender", y = "Literacy Rate", title = "Literates by Gender (Bar Graph)")
      
    } else if (input$plotType == "Education Plot") {
      # Education plot
      ggplot(df_filtered, aes(x = name_of_city, y = total_graduates)) +
        geom_bar(stat = "identity", fill = "red") +
        labs(x = "City", y = "Education", title = "Education of Cities") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
      
    } else if (input$plotType == "Male Education Plot") {
      # Male education plot
      ggplot(df_filtered, aes(x = name_of_city, y = male_graduates)) +
        geom_bar(stat = "identity", fill = "skyblue") +
        labs(x = "City",
             y = "Number of Male Graduates", 
             title = "Number of Male Graduates in Cities") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
      
    } else if (input$plotType == "Female Education Plot") {
      # Female education plot
      ggplot(df_filtered, aes(x = name_of_city, y = female_graduates)) +
        geom_bar(stat = "identity", fill = "pink") +
        labs(x = "City", y = "Graduates", title = "Female Graduates in Cities") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
      
    } else if (input$plotType == "Gender Education Plot") {
      # Gender education plot
      males <- sum(df_filtered$male_graduates)
      females <- sum(df_filtered$female_graduates)
      maleFemaledf <- data.frame(Gender = c("Females", "Males"),
                                 Population = c(females, males))
      ggplot(maleFemaledf, aes(x = Gender, y = Population, fill = Gender)) +
        geom_bar(stat = "identity") +
        labs(x = "Gender", y = "Graduates", title = "Graduates by Gender (Bar Graph)")
      
    } else {
      # Default plot
      ggplot() + 
        geom_point() +
        labs(x = NULL, y = NULL, title = "No Plot Selected")
    }
  })
}

    
  
 
