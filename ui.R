library(shiny)

# Define UI
ui <- fluidPage(
  
  tags$head(
    tags$style(
      HTML(
        "
        body {
          margin: 0; /* Remove default body margin */
          padding: 0; /* Remove default body padding */
          background: linear-gradient(to bottom right, #ffffff, #f2f2f2); /* Gradient background */
          font-family: 'Arial', sans-serif; /* Change font */
        }
        
        .container {
          max-width: 800px; /* Limit container width */
          margin: auto; /* Center container */
        }
        
        .title {
          text-align: center; /* Center align title */
          margin-bottom: 30px; /* Add space below title */
        }

        .title h1 {
          color: #007bff; /* Blue color for heading */
          font-weight: bold; /* Make the heading bold */
          text-decoration: none; /* Remove underline */
          padding: 10px 20px; /* Add padding */
          border-radius: 10px; /* Add border radius */
          box-shadow: 0px 0px 20px rgba(0,0,0,0.5); /* Add shadow effect to border */
        }
        
        .sidebar {
          border-radius: 10px; /* Rounded corners */
          padding: 20px; /* Add padding */
          background-color: #f8f9fa; /* Light grey background */
          box-shadow: 0px 0px 20px rgba(0,0,0,0.5); /* Add stronger shadow */
          transition: box-shadow 0.3s ease; /* Smooth shadow transition */
        }
        
        .plot {
          border-radius: 10px; /* Rounded corners */
          padding: 20px; /* Add padding */
          box-shadow: 0px 0px 20px rgba(0,0,0,0.5); /* Add stronger shadow */
          transition: box-shadow 0.3s ease; /* Smooth shadow transition */
        }
        
        .btn-primary {
          background-color: #007bff !important; /* Blue button background */
          border-color: #007bff !important; /* Blue button border */
          border-radius: 10px; /* Rounded corners */
          padding: 10px 20px; /* Add padding */
          font-size: 16px; /* Increase font size */
          transition: background-color 0.3s ease, transform 0.3s ease; /* Smooth hover transition */
        }
        
        .btn-primary:hover {
          background-color: #0056b3 !important; /* Darker blue on hover */
          transform: scale(1.05); /* Scale up on hover */
        }
        "
      )
    )
  ),
  
  div(
    class = "container",
    div(class = "title",
        h1(HTML("<span>STATE</span> <span>DEMOGRAPHIC</span> <span>ANALYSIS</span>"),
           style = "color: #007bff;"  # Blue color for heading
        )
    ),
    
    sidebarLayout(
      sidebarPanel(
        class = "sidebar",
        selectInput("state", "Select State", choices = unique(df$state_name)),
        br(),
        selectInput("plotType", "Select Plot Type",
                    choices = c("Population Plot", "Pie Chart", "Bubble Plot", "Circular Plot", 
                                "Male Population Plot", "Literacy Plot", "Male Literacy Plot", 
                                "Female Literacy Plot", "Gender Literacy Plot", "Education Plot",
                                "Male Education Plot", "Female Education Plot", "Gender Education Plot")),
        br(),
        actionButton("submit", "Submit", class = "btn btn-primary btn-block")
      ),
      mainPanel(
        class = "plot",
        plotOutput("selectedPlot")
      )
    )
  )
)






