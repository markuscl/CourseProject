#ui.R
shinyUI(fluidPage(
  
  #  Application title
  titlePanel("Various forecasts for German population by age groups until 2060"),
  
  sidebarLayout(
    sidebarPanel(
      
      #Different variants for the population forecast
      selectInput("variant", "Choose forecast variant:", 
                  choices = c("Variante 1-W1 EJ", "Variante 1-W2 EJ", "Variante 2-W1 EJ",
                              "Variante 2-W2 EJ", "Variante 3-W1 EJ", "Variante 3-W2 EJ",
                              "Variante 4-W1 EJ", "Variante 4-W2 EJ", "Variante 5-W1 EJ",
                              "Variante 5-W2 EJ", "Variante 6-W1 EJ", "Variante 6-W2 EJ"), selected = "Variante 1-W1 EJ"),     
      
      # Animation with custom interval (in ms) to control speed,
      # plus looping
      sliderInput("year", "Year:", min=2009,max=2060, value= 2009, format = "0000",
                  step = 1, animate=
                    animationOptions(interval=300, loop=TRUE))
    ),    
    # Show legend for assumptions behind the different forecast scenarios
    mainPanel(      
      plotOutput("pyramid", height="600px"),      
       h3("Assumptions"),
       h2(textOutput('sum')),      
       h4(textOutput('assumptions')),
       h6(textOutput('fertility')),
       h6(textOutput('life')),
       h6(textOutput('mig'))
      
          )
  )
))

