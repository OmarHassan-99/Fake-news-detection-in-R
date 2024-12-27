
rf_model <- randomForest(train_data, train_labels,ntree=100, importance = TRUE)
rf_predictions <- predict(rf_model, newdata = test_data)
AccuracyRF<-mean(rf_predictions==test_labels)
AccuracyRF*100

