# ui.R
library(shiny)

# Define UI
ui <- fluidPage(
  
  tags$head(
    tags$style(
      HTML(
        "
        body {
          background: linear-gradient(to bottom, #f2f2f2, #ffffff); /* Gradient background */
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
          color: #28a745; /* Green color for heading */
        }

        .title h1 .red-underline {
          border-bottom: 2px solid #dc3545; /* Red underline */
          display: inline-block; /* Break the line after each word */
        }
        
        .sidebar {
          border: 2px solid #dc3545; /* Red border for sidebar */
          border-radius: 10px; /* Rounded corners */
          padding: 20px; /* Add padding */
          background-color: #f8f9fa; /* Light grey background */
          box-shadow: 0px 0px 10px rgba(0,0,0,0.1); /* Add shadow */
          transition: border-color 0.3s ease; /* Smooth border color transition */
        }
        
        .plot {
          background-color: #fff; /* White background for plots */
          border-radius: 10px; /* Rounded corners */
          padding: 20px; /* Add padding */
          box-shadow: 0px 0px 10px rgba(0,0,0,0.1); /* Add shadow */
          border: 2px solid #28a745; /* Green border for plot area */
          transition: border-color 0.3s ease; /* Smooth border color transition */
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
  
  div(class = "container",
      div(class = "title",
          h1(HTML("<span class='red-underline'>STATE</span> <span class='red-underline'>DEMOGRAPHIC</span> <span class='red-underline'>ANALYSIS</span>"),
             style = "color: #28a745;"  # Green color for heading
          )
      ),
      
      sidebarLayout(
        sidebarPanel(
          class = "sidebar",
          selectInput("state", "Select State", choices = unique(df$state_name)),
          br(),
          selectInput("plotType", "Select Plot Type",
                      choices = c("Population Plot", "Pie Chart", "Bubble Plot", "Circular Plot", "Male Population Plot")),
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







