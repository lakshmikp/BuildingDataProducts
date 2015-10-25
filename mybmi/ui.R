library(shiny)
library(shinythemes)

shinyUI(
  fluidPage(
    theme=shinytheme("united"),
    headerPanel("BMI Calculator"),
    
    
    
      
      
    sidebarPanel(
      h4('This Shiny app computes your Body Mass Index (BMI) based on your height & weight. The app also provides a classification based on the BMI value.'),
      hr(),
      hr(),
      numericInput('wt', 'Enter your weight in kilograms',45 , min = 50, max = 200, step = 1),
      numericInput('ht', 'Enter your height in centimeters',150 , min = 50, max = 200, step = 1),
      submitButton('Submit')
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Output", 
                 h3('Your weight (in kg) is'),
                 verbatimTextOutput("inputWeight"),
                 h3('Your height (in cm) is'),
                 verbatimTextOutput("inputHeight"),
                 h3('Your BMI calculated is '),
                 verbatimTextOutput("bmi"),
                 h3('As per this BMI you are classified as '),
                 verbatimTextOutput("classification")
                 ), 
        tabPanel("More about BMI", 
                  h3("BMI = weight in kg / ((height in meters)*(height in meters))"),
                  h3("BMI based classfication:"),
                  h4("BMI < 18.5: Underweight"),
                  h4("BMI >= 18.5 and < 25: Normal weight"),
                  h4("BMI >= 25 and <30: Overweight"),
                  h4("BMI >= 30: Obese")
                  
                )
       )
    )
)
)
