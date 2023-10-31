#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage

  library(ggplot2)
  
  # Assuming "DataS" is your dataset containing "age" and "mental_state" columns
 DataSc
  
  ui <- fluidPage(
    sidebarLayout(
      sidebarPanel(
        # No input required in this example
      ),
      mainPanel(
        plotOutput("histogram")
      )
    )
  )
  
  server <- function(input, output) {
    output$histogram <- renderPlot({
      # Create the histogram plot using ggplot2
      ggplot(DataSc, aes(x = Age , fill = MMSE_class_binary)) +
        geom_histogram(binwidth = 5, position = "dodge") +
        labs(x = "Age", y = "Count", fill = "Mental State") +
        theme_minimal()
    })
  }
  
  shinyApp(ui, server)
  