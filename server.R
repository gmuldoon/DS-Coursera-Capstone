library(shinythemes)
library(shiny)
library(tm)
library(stringr)
library(markdown)
library(stylo)

source("./cleanPhrase.R")

shinyServer(function(input, output) {
    
    wordPrediction = reactive({
        text = input$text
        textIn = cleanPhrase(text)
        wordCount = length(textIn)
        wordPrediction = nextWordPrediction(wordCount,textIn)})
    output$predictedWord = renderPrint(wordPrediction())
})