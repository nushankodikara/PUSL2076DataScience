
# Web Content Scraping
install.packages("rvest")
install.packages("xml2")
library(rvest)
library(xml2)

content <- read_html("https://kellyfelder.com")

# analyze the content
h1_topics <- content %>% html_nodes("h1") %>% html_text()
h1_topics
hyperlinks <- content %>% html_nodes("a") %>% html_attr("href")
hyperlinks

# Text Analysis

library(tidyverse)
library(tidytext)
library(reshape2)
library(textdata)
library(knitr)
library(tm)
library(ggplot2)
library(RColorBrewer)
library(wordcloud)
library(SnowballC)
library(here)

data <- read_file(here("Y2S2","TextFiles","Speech00.txt"))
print(data)

# Making Corpus
corpus <- Corpus(VectorSource(data))
corpus

# Data Pre-Processing
cleaned_corpus <- tm_map(corpus, content_transformer(tolower)) # Convert to lower case
cleaned_corpus <- tm_map(cleaned_corpus, removePunctuation) # Remove punctuation
cleaned_corpus <- tm_map(cleaned_corpus, removeNumbers) # Remove numbers
cleaned_corpus <- tm_map(cleaned_corpus, removeWords, stopwords("en")) # Remove stop words
cleaned_corpus <- tm_map(cleaned_corpus, stripWhitespace) # Remove extra white spaces
inspect(cleaned_corpus)

# Word Frequency Index
word_freq <- TermDocumentMatrix(cleaned_corpus)
word_freq_matrix <- as.matrix(word_freq)
word_freq_matrix <- sort(rowSums(word_freq_matrix), decreasing = TRUE)
word_freq_df <- data.frame(word = names(word_freq_matrix), freq = word_freq_matrix)
head(word_freq_df, 10)

# Word Cloud
set.seed(100)
wordcloud(cleaned_corpus, min.freq = 10, random.order = F, colors = brewer.pal(8, "Dark2"))

# Terms related with "People"
word <- data.frame(findAssocs(word_freq, "the", 0.4))
title <- expression(paste("Words Associated with ", italic("People")))
word %>% rownames_to_column() %>%
ggplot(aes(x = reorder(rowname, word), y = word)) +
  geom_point(shape=15, size=2)
