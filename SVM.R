
svm_model <- svm(train_data, train_labels, kernel = "radial")
svm_predictions <- predict(svm_model, test_data)
AccuracySVM<-mean(svm_predictions==test_labels)
AccuracySVM*100
#------------------------------------------------
confusionMatrix(svm_predictions, test_labels)

