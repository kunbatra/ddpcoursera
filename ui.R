shinyUI(
  
  pageWithSidebar(
  # Application title 
  headerPanel("Height prediction of children given parent height"),
  
  
sidebarPanel(
    p(h3('Please enter parent height:')),
    sliderInput('parHeight', 'Parent Height (in inches)', 66.5, min = 60, max = 100, step = 0.5), submitButton('Submit')
  ),
  
mainPanel(
    h3('Predicted height of child'), 
    p(h5("This app uses the Galton parent-child height data to fit a linear model to predict child height with parent height as a predictor. This data set consists of 928 observations of child parent heights where parent height is the average of father's height and 1.08 times mother's height.")),
    p(h5("Based on the model fit, this app predicts the height of a child given a new data i.e. parent height")),
    p(h4("To use the app, follow the steps:")),
    p(h5("(1) Enter a parent height (in inches) in the left panel input box.")),
    p(h5("(2) Click Submit.")),
    p(h5("(3) The predicted child height along with 95% confidence interval is displayed in the right panel")),
    h4('Parent height entered:'), 
    verbatimTextOutput("entValue"),
    h4('Child height predicted '), 
    verbatimTextOutput("chHeightPred"),
    h4('Child height: Conf. interval(lower bound) '), 
    verbatimTextOutput("chHeightLInt"),
    h4('Child height: Conf. interval(upper bound) '), 
    verbatimTextOutput("chHeightUInt")
      )
    )
)