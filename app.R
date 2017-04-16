library(shiny)
ui <- fluidPage(
  titlePanel("Standard Normal Z Value to P Value Converter"),
  numericInput(inputId = "z", label = "Select Z Score", value = "0", min = "-5", max = "5", step = "0.1"),
  textOutput(outputId = "p")
)

server <- function(input, output){
  output$p <- renderText({2*pnorm(-abs(input$z))})
  
  output$signif <- renderText({if (abs(input$z) < 1.96) {print("Results are not significant at p < 0.05")}
    else {print("Results are statistically significant at p < 0.05")}
    })
  }


shinyApp(ui = ui, server = server)