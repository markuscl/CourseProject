#server.R

shinyServer(function(input, output) {
  
  #reactive data set is read in, assuming the file is in the folder
  dataSet_names <- reactive({ 
         dataset <- read.xlsx("Data//VorausberechnungDeutschland.xls", input$variant, startRow =11, endRow=12)
         dataset <- sapply(dataset, function(x) as.character(x))
         })
  #reading reactive the age categories
  dataSet_sheet <- reactive({
           dataset <- read.xlsx("Data/VorausberechnungDeutschland.xls", input$variant, startRow=12, endRow=168, header = TRUE)})
  
  
  #having installed the package pyramid, it is simply feeding in the data
  output$pyramid <- renderPlot({   
    sheet = dataSet_sheet()  
    names = dataSet_names()  
    #one change to english spelling is necessary
    names[105] <- "100 and older"
    names(sheet) <- names      
    
    #I am just jumping within the rows instead of creating a data.table and sorting, seemed be faster variant
    colm = (input$year - 2009)*3 + 1
    colf = (input$year - 2009)*3 + 2
    
    #important is that the values are numeric, otherwise pyramid command does not accept it
    py.Males <- as.numeric(sheet[colm,5:105])
    names(py.Males) <- names[5:105]
    py.Females <- as.numeric(sheet[colf,5:105])    
    pyramids(Left=py.Males,Llab="Males",Right=py.Females,Rlab="Females",Laxis=seq(0,1000,100),Csize=0.8, Cstep=5, 
             main=paste("German Population pyramid\n for Scenario :", input$variant, "\n (in 100 thousand)"))  
    
  })
  
  
    #I am taking the assumptions from a function i have written in the global.R
    output$assumptions <- reactive({input$variant})
    params <- reactive ({variantChecker(input$variant)})
    output$fertility      <- renderText({
                             params <- params()
                             paste("Fertility assumptions: ", params$f)})
  
    output$life           <- renderText({
                             params <- params()
                             paste("Life expectancy: ", params$l)})
    output$mig           <- renderText({
                             params <- params()
                             paste("Migration: ", params$m)})
  
  
  
})