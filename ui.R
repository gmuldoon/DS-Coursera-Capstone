library(RCurl) 
library(shinythemes)
library(shiny)
library(tm)
library(stringr)
library(markdown)
library(stylo)

shinyUI(navbarPage("",
                   theme = shinytheme("superhero"),
                   tabPanel("Home",
                            fluidRow(
                                column(1),
                                column(6,
                                       tags$div(textInput("text", 
                                                          label = h3("Enter a phrase in English:"),
                                                          value = ),
                                                align="center",offset=0)
                                ),
                                column(3,
                                       tags$div(
                                                h3("Predicted next word:"),
                                                tags$span(style="color:pink",
                                                          tags$strong(tags$h3(textOutput("predictedWord")))),
                                                align="center",offset=0)
                                ),
                                column(1),
                                column(12, h4("(Results may take a few moments.)"), align="center")) ),
                   
                   ## About
                   tabPanel("About",
                            fluidRow(
                                column(2,
                                       p("")),
                                column(8,
                                       includeMarkdown("./description.Rmd")),
                                column(2,
                                       p(""))
                            )
                   )
))