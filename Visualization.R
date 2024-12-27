#-------------------------------------------------------------------------------
#DT
displayTree<-function(){
rpart.plot(decision_tree)
}
#---------------------------------

compareClassified<-function(){
par(mfrow=c(1,4))
#classified
plot(NBpredictions,col="green",main="NB",ylim=c(0,2000))
plot(rf_predictions,col="red",main="RF",ylim=c(0,2000))
plot(DTprediction,main="DT",col="yellow",ylim=c(0,2000))
plot(svm_predictions,col="purple",main="SVM",ylim=c(0,2000))
}

ModelNames <- c("NB","DT","RF","SVM")
compareAccuracy<-function(){
par(mfrow=c(1,2))
ModelAccuracies<-c(AccuracyNB,ACCURACYDT,AccuracyRF,AccuracySVM)
barplot(ModelAccuracies, names.arg =ModelNames, col = "green",
        main = "Model Accuracies", ylab = "Accuracy",ylim=c(0,1))


MisclassificationRates <- 1 - ModelAccuracies
barplot(MisclassificationRates, names.arg=ModelNames, col="red",
        main="Misclassification Rates", ylab="Rate", ylim=c(0, 1))
}
#------------------------------------------

compareTime<-function(){
par(mfrow=c(1,2))

ModelTrainingTimes<-c(nb_time_train,dt_time_train,rf_time_train,svm_time_train)
barplot(ModelTrainingTimes, names.arg =ModelNames, col = "orange",
        main = "Training Time", ylab = "Elapsed time",ylim=c(0,200))

ModelPredictionTimes<-c(nb_time,dt_time,rf_time,svm_time)
barplot(ModelPredictionTimes, names.arg =ModelNames, col = "blue",
        main = "Prediction Time", ylab = "Elapsed time",ylim=c(0,200))
}

#shows accuracy of each model
showAccuracy<-function(){
  #-----NAIVE BAYES
  print(sprintf("Naive Bayes Accuracy: %.2f%%", AccuracyNB * 100))
  #----Random Forest
  print(sprintf("Random Forest Accuracy: %.2f%%", AccuracyRF * 100))
  #----Support Vector Machine
  print(sprintf("Support Vector Machine Accuracy: %.2f%%", AccuracySVM * 100))
  #----Decision Tree
  print(sprintf("Decision Tree Accuracy: %.2f%%", ACCURACYDT * 100))
  
}
