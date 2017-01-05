library(shinythemes)
library(shiny)
library(tm)
library(stringr)
library(markdown)
library(stylo)

quadData = readRDS(file="quadgramData.rdata")
triData = readRDS(file="trigramData.rdata")
biData = readRDS(file="bigramData.rdata")

textCleaner = function(text){
    cleanText = tolower(text)
    cleanText = removePunctuation(cleanText)
    cleanText = removeNumbers(cleanText)
    cleanText = str_replace_all(cleanText, "[^[:alnum:]]", " ")
    cleanText = stripWhitespace(cleanText)
    return(cleanText)
}

cleanPhrase = function(text){
    textIn = textCleaner(text)
    textIn = txt.to.words.ext(textIn, 
                                  language="English.all", 
                                  preserve.case = TRUE)
    return(textIn)
}

nextWordPrediction = function(wordCount,textIn){
    if (wordCount>=3) {
        textIn = textIn[(wordCount-2):wordCount] }
    else if(wordCount==2) {
        textIn = c(NA,textIn)  }
    else {
        textIn = c(NA,NA,textIn)}
    wordPredict = as.character(quadData[quadData$unigram==textIn[1] & 
                                                  quadData$bigram==textIn[2] & 
                                                  quadData$trigram==textIn[3],][1,]$quadgram)
    if(is.na(wordPredict)) {
        wordPredict = as.character(triData[triData$unigram==textIn[2] & 
                                                       triData$bigram==textIn[3],][1,]$trigram)
        if(is.na(wordPredict)) {
            wordPredict = as.character(biData[biData$unigram==textIn[3],][1,]$bigram)
        }
    }
    cat(wordPredict)
}