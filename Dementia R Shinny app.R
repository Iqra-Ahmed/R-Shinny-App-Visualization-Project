# Read the data
dementia_dataset <- read.csv("C:/Users/user/Downloads/data set  - data set .csv")
# Define UI
ui <- fluidPage(
  titlePanel("dementia_dataset.csv"),
  sidebarLayout(
    sidebarPanel(
      # Add any input controls if needed
    ),
    mainPanel(
      # Add output elements for plots or other visualizations
      plotOutput("age_distribution"),
      plotOutput("age_by_mmse_class"),
      plotOutput("gds_distribution"),
      plotOutput("gds_by_mmse_class"),
      plotOutput("mna_distribution"),
      plotOutput("mna_by_mmse_class"),
      plotOutput("age_by_mmse_class_and_gender")
    )
  )
)

# Define server
server <- function(input, output) {

  # Distribution of Age
  output$age_distribution <- renderPlot({
    ggplot(dementia_dataset, aes(x = Age)) +
      geom_histogram(binwidth = 1, fill = "#69b3a2", color = "#e9ecef", alpha = 0.9) +
      labs(title = "Distribution of Age")
  })
  
  # Boxplot of Age by MMSE Class
  output$age_by_mmse_class <- renderPlot({
    ggplot(dementia_dataset, aes(x = as.factor(MMSE_class_binary), y = Age)) +
      geom_boxplot(fill = "#69b3a2", color = "#e9ecef", alpha = 0.9) +
      labs(x = "MMSE_class_binary", y = "Age", title = "Boxplot of Age by MMSE Class")
  })
  
  # Distribution of GDS (Geriatric Depression Scale) scores
  output$gds_distribution <- renderPlot({
    ggplot(dementia_dataset, aes(x = GDS)) +
      geom_histogram(binwidth = 1, fill = "#69b3a2", color = "#e9ecef", alpha = 0.9) +
      labs(title = "Distribution of GDS Scores")
  })
  
  # Boxplot of GDS by MMSE Class
  output$gds_by_mmse_class <- renderPlot({
    ggplot(dementia_dataset, aes(x = as.factor(MMSE_class_binary), y = GDS)) +
      geom_boxplot(fill = "#69b3a2", color = "#e9ecef", alpha = 0.9) +
      labs(x = "MMSE_class_binary", y = "GDS", title = "Boxplot of GDS Scores by MMSE Class")
  })
  
  # Distribution of MNA scores
  output$mna_distribution <- renderPlot({
    ggplot(dementia_dataset, aes(x = MNAa_total + MNAb_total)) +
      geom_histogram(binwidth = 1, fill = "#69b3a2", color = "#e9ecef", alpha = 0.9) +
      labs(title = "Distribution of Total MNA Scores")
  })
  
  # Boxplot of Total MNA Scores by MMSE Class
  output$mna_by_mmse_class <- renderPlot({
    ggplot(dementia_dataset, aes(x = as.factor(MMSE_class_binary), y = MNAa_total + MNAb_total)) +
      geom_boxplot(fill = "#69b3a2", color = "#e9ecef", alpha = 0.9) +
      labs(x = "MMSE_class_binary", y = "Total MNA Score", title = "Boxplot of Total MNA Scores by MMSE Class")
  })
  
  # Boxplot of Age by MMSE Class and Gender
  output$age_by_mmse_class_and_gender <- renderPlot({
    ggplot(dementia_dataset, aes(x = as.factor(MMSE_class_binary), y = Age, fill = as.factor(Gender))) +
      geom_boxplot(alpha = 0.7) +
      labs(x = "MMSE_class_binary", y = "Age", fill = "Gender",
           title = "Boxplot of Age by MMSE Class and Gender") +
      scale_fill_discrete(name = "Gender", labels = c("Male", "Female"))
  })
}

# Create Shiny app object
shiny_app <- shinyApp(ui = ui, server = server)

# Run the app

