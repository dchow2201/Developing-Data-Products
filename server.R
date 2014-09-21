predictMPG<-function(cylinders,weight){
  data(mtcars)
  mtcars$cyl<-factor(as.character(mtcars$cyl))
  modelFit<-lm(mpg~cyl+wt,data=mtcars)
  cylinders<-as.character(cylinders)
  mpg=predict(modelFit,data.frame(cyl=cylinders,wt=weight))
  return(mpg[[1]])
}
shinyServer(
  function(input,output){
    output$inputCyl<-renderPrint({input$Cyl})
    output$inputWt<-renderPrint({input$Wt})
    output$prediction<-renderPrint({predictMPG(input$Cyl,input$Wt)})
    
  }  
)