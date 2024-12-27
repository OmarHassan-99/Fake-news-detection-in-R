
DTM_TITLE_TEXT <- DocumentTermMatrix(news_data$title_text)

# keep frequent items (app crashes if not done because of the orignal size of 9.1GB)
DTM_TITLE_TEXT <- removeSparseTerms(DTM_TITLE_TEXT, 0.99)

#sparse to numeric 
DTM_TITLE_TEXT <- as.matrix(DTM_TITLE_TEXT)

labels <- tolower(news_data$label)
labels <- factor(labels,levels = c("fake", "real"))
  
 #----------> 80% train -  20% test
trainSet <- sample(1:4000, size = 0.8 * 4000)
train_data <- DTM_TITLE_TEXT[trainSet, ]
train_labels <- labels[trainSet]
test_data <- DTM_TITLE_TEXT[-trainSet, ]
test_labels <- labels[-trainSet]

dim(train_data)
dim(test_data)