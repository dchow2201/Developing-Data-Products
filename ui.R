library(shiny)
pageWithSidebar(
  headerPanel("The following web site will predict your car's mpg 
        base on number of cylinders it has and its weight"), 
  sidebarPanel(    
    h3('Please enter the number of cylinders your cars has,
        the choices are 4, 6, or 8'),
    numericInput('Cyl','Number of cylinders',4,min=4,max=8,step=2),
    h3('Please specify the weight of your car in lb/1000,
        example: if your car weight 3000 lb, then you should
        specify 3'),
    sliderInput('Wt',"Weight (lb/1000)",value=3,min=1.5,max=5.5,step=0.1),    
    h3('After the number of cylinders and the weight of your car has been
        specify, click of the submit button below to run the prediction.'),
    submitButton('Submit')    
  ),
  mainPanel(
    h2("If you have click on the submit button, the prediction of your
        car's mpg will be shown in the following:"),
    h3('Prediction result'),
    h4('The number of cylinders you entered is'),
    verbatimTextOutput("inputCyl"),
    h4('The Weight (lb/1000) you entered is'),
    verbatimTextOutput("inputWt"),
    h4('The predicted MPG (Miles/(US) gallon) for your car is '),
    verbatimTextOutput("prediction")
  ) 
  
)