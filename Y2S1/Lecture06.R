library(mlbench)
data(BreastCancer)
str(BreastCancer)
summary(BreastCancer)
levels(BreastCancer$Class)

#Classifier
library(caTools)
set.seed(150)
split <- sample.split(BreastCancer, SplitRatio = 0.8)

training_set <- subset(BreastCancer, split == TRUE)
testing_set <- subset(BreastCancer, split == FALSE)

dim(training_set)
dim(testing_set)

library(e1071)
naiveClassifier <- naiveBayes(Class ~ ., data = training_set)

#Predicting the test set results
predicted_results <- predict(naiveClassifier, newdata = testing_set)

#Making the confusion matrix
library(lattice)
library(caret)
cm <- table(testing_set$Class, predicted_results)
confusionMatrix(cm)

