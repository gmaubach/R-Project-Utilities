#
# Sources:
# http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know
# https://georeferenced.wordpress.com/2013/01/15/rwordcloud/
# http://www.martinschweinberger.de/blog/creating-word-clouds-with-r/
#
cat("# v17")

library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

# -- Load text
text <- readLines(file.choose())
docs <- Corpus(VectorSource(text))
inspect(docs)

# -- Cleaning
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove german common stopwords
docs <- tm_map(docs, removeWords, stopwords("german"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(
  docs,
  removeWords,
  c("sowie", "seit", "etwa", "gilt", "kam", "pro", "rund",
    "samt", "seitdem", "woraus", "wurden"))
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
# docs <- tm_map(docs, stemDocument)

# # -- Term Document Matrix
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

# -- Generate Word Cloud
set.seed(1234)
wordcloud(
  words = d$word,
  freq = d$freq,
  min.freq = 1,
  max.words = 200,
  random.order = FALSE,
  rot.per = 0.35,
  colors = brewer.pal(8, "Dark2"))
