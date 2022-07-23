#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)

df <- 

ui <- fluidPage(
  HTML("<h4>Konsolidacne opatrenia</h4>"),
  shinyjs::useShinyjs(),
  checkboxInput("EXBR", "Znizenie dane z piva", FALSE),
  sliderInput("EXBRGy", "sliderik", 
              min = 2, max = 60, value = 20),
  
  checkboxInput("EXBR1", "Zrusenie piva", FALSE),
  sliderInput("EXBRGx", "sliderik", 
              min = -40, max = 50, value = 20),
)


server <- function(input, output, session) {
  observeEvent(input$EXBR, {
    if(input$EXBR == TRUE){
      show("EXBRGy")
    }else{
      hide("EXBRGy")
    }
  })
  
  observeEvent(input$EXBR1, {
    if(input$EXBR1 == TRUE){
      show("EXBRGx")
    }else{
      hide("EXBRGx")
    }
  })
}

shinyApp(ui, server)