library(shiny)
library(UsingR)
data(galton)

predHeight <- function(parHeight){
  lmfit <- lm(child ~parent, data=galton)
  newParent <- data.frame(parent = parHeight)
  lmpred <- predict(lmfit, newdata=newParent,level=0.95,interval='confidence')
  lmpred
} 

shinyServer( function(input, output) {
  output$sunPlot      <- renderPlot({sunflowerplot(galton)})
  output$entValue     <- renderPrint({input$parHeight})
  output$chHeightPred <- renderPrint({round(predHeight(input$parHeight)[,1],2)}) 
  output$chHeightLInt <- renderPrint({round(predHeight(input$parHeight)[,2],2)})
  output$chHeightUInt <- renderPrint({round(predHeight(input$parHeight)[,3],2)})
    }
)

