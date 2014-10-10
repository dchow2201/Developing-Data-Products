data(mtcars)
predictMPG<-function(cylinders,weight){  
  mtcars$cyl<-factor(as.character(mtcars$cyl))
  modelFit<-lm(mpg~cyl*wt,data=mtcars)
  cylinders<-as.character(cylinders)
  mpg=predict(modelFit,data.frame(cyl=cylinders,wt=weight))
  return(mpg[[1]])
}

shinyServer(
  function(input,output){
    output$inputCyl<-renderPrint({input$Cyl})
    output$inputWt<-renderPrint({input$Wt})
    output$prediction<-renderPrint({predictMPG(input$Cyl,input$Wt)})
    output$C<-renderPlot({
      plot(mtcars$wt,mtcars$mpg,xlab="Weight (lb/1000)",
           ylab="MPG (Miles/(US) gallon)",type="n",
           main=paste("Linear Regression on MPG vs. Weight for a",
                      input$Cyl,"cylinders car"))
      x=(mtcars$cyl==input$Cyl)
      points(mtcars$wt[x],mtcars$mpg[x],pch=19,col="red")
      abline(lm(mtcars$mpg[x]~mtcars$wt[x]),col="blue")
    })
  }  
)