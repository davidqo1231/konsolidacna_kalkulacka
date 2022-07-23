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
library(dplyr)

df <- readr::read_csv(file = "https://raw.githubusercontent.com/davidqo1231/konsolidacna_kalkulacka/main/Data/Data.csv")
  
ui <- fluidPage(
  HTML("<h4>Konsolidacne opatrenia</h4>"),
  shinyjs::useShinyjs(),
  
  #01 - Zmena zdanenia piva
  checkboxInput("id01", df[df$id == 1, "measure_name"], FALSE),
  sliderInput("s_id01", df[df$id == 1, "slider_unit"], 
              min = 10, max = 30, value = 20, step = 1, post = " %"),
  
  #02 - Policajti do dochodku
  checkboxInput("id02", df[df$id == 2, "measure_name"], FALSE),
  sliderInput("s_id02", df[df$id == 2, "slider_unit"], 
              min = 40, max = 60, value = 50, step = 1, post = " rokov"),
  
  #03 - Zdanenie mineralnych olejov
  checkboxInput("id03", df[df$id == 3, "measure_name"], FALSE),
  sliderInput("s_id03", df[df$id == 3, "slider_unit"], 
              min = 35, max = 55, value = 45, step = 1, post = " %"),
  
  #04 - Zrusenie vlakov zadarmo
  checkboxInput("id04", df[df$id == 4, "measure_name"], FALSE)

)


server <- function(input, output, session) {
  observeEvent(input$id01, {
    if(input$id01 == TRUE){
      show("s_id01")
    }else{
      hide("s_id01")
    }
  })
  
  observeEvent(input$id02, {
    if(input$id02 == TRUE){
      show("s_id02")
    }else{
      hide("s_id02")
    }
  })
  
  observeEvent(input$id03, {
    if(input$id03 == TRUE){
      show("s_id03")
    }else{
      hide("s_id03")
    }
  })
  
  # Pri tych kde su len checkboxy to treba nejak vymysliet inak, to show len pri slideroch
  observeEvent(input$id04, {
    if(input$id04 == TRUE){
      show("s_id04")
    }else{
      hide("s_id04")
    }
  })
}

shinyApp(ui, server)