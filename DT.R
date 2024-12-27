train_data <- as.data.frame(train_data) 
test_data <- as.data.frame(test_data)   

decision_tree <- rpart(train_labels ~., data = train_data, method = "class")

DTprediction <- predict(decision_tree, newdata = test_data, type = "class")

ACCURACYDT<-mean(DTprediction==test_labels)

#-------------------------------------------
#summary(decision_tree)

rpart.plot(decision_tree)
confusionMatrix(DTprediction, test_labels)

