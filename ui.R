library(shiny)
pageWithSidebar(
  headerPanel("Shiny Application Project"), 
  sidebarPanel(
    numericInput('Cyl','Number of cylinders',4,min=4,max=8,step=2),
    sliderInput('Wt',"Weight (lb/1000)",value=3,min=1.5,max=5.5,step=0.1),    
    submitButton('Submit')    
  ),
  mainPanel(
    h3('Result of prediction'),
    h4('The number of cylinders you entered is'),
    verbatimTextOutput("inputCyl"),
    h4('The Weight (lb/1000) you entered is'),
    verbatimTextOutput("inputWt"),
    h4('The predicted MPG (Miles/(US) gallon) for your car is '),
    verbatimTextOutput("prediction"),
    plotOutput('C')
  ) 
  
)