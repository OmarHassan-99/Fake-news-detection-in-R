nb_model <- naiveBayes(train_data, train_labels)
NBpredictions <- predict(nb_model, test_data)
AccuracyNB<-mean(NBpredictions==test_labels)
#--------------------------------------------
confusionMatrix(NBpredictions, test_labels)
table(NBpredictions)

