#------------will be used in visualization
nb_time <- system.time(NBpredictions <- predict(nb_model, test_data))[3]
nb_time_train<-system.time(nb_model <- naiveBayes(train_data, train_labels))[3]


dt_time <- system.time(DTprediction <- predict(decision_tree, test_data))[3]
dt_time_train<-system.time(decision_tree <- rpart(train_labels ~ ., data = train_data, method = "class"))[3]

#--------------------------------------
svm_time <- system.time(svm_predictions <- predict(svm_model, test_data))[3]
svm_time_train <- system.time(svm_model <- svm(train_data, train_labels, kernel = "radial"))[3]

rf_time <- system.time(rf_predictions <- predict(rf_model, test_data))[3]
rf_time_train <- system.time(rf_model <- randomForest(train_data, train_labels, ntree = 100, importance = TRUE))[3]