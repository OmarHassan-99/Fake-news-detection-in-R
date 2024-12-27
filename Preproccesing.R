dim(news_data)
#7797 row and 141 column

#removing unnecessary columns
news_data <- news_data[, c("title", "text", "label")]

news_data$label<-tolower(news_data$label)
news_data$text<-tolower(news_data$text)
news_data$title<-tolower(news_data$title)


#7797 and 3 column

#remove ( NULL and invalid labels - NULL and invalid text)
news_data <- news_data[news_data$label %in% c("fake", "real"), ]
news_data <- news_data[!is.na(news_data$title), ]
news_data <- news_data[!is.na(news_data$text), ]

#6317 3

news_data$title_text <- paste(news_data$title, news_data$text, sep = " ")
news_data <- news_data[!duplicated(news_data$title_text), ]

#6286 4
news_data$title_text <- removePunctuation(news_data$title_text) #DT doesn't work without this step

#------------------------Extra----------------
news_data$wordcount <- str_count(news_data$title_text, "\\S+")
news_data <- news_data[news_data$wordcount >=100,]
#5652 5

summary(news_data)
dim(news_data)

