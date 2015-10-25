library(shiny)

bmi <- function(wt, ht) wt/((ht/100)^2)
classification <- function(bmi){
  if (bmi < 18.5){
    print("Underweight")
  } else if (bmi < 25) {
    print ("Normal weight")
  }
   else if (bmi < 30){
     print ("Overweight")
   } else print("Obese")
} 

shinyServer(
  function(input, output) {
    output$inputWeight <- renderPrint({input$wt})
    output$inputHeight <- renderPrint({input$ht})
    
    currentBMI <- reactive({bmi(input$wt, input$ht)})
    output$bmi <- renderPrint( {currentBMI()})
    output$classification <- renderPrint({classification(currentBMI())})
    
  }
)