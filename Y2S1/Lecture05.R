# naive Baye's classifier
data(iris)
irisDF <- data.frame(iris)
summary(iris)

library(ggplot2)

# sepal length
ggplot(irisDF, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.3, color = "white", aes(fill=Species)) +
  labs(x = "Sepal Length",
       y = "Frequency",
       title = "Histogram of Sepal Length")

# sepal width
ggplot(irisDF, aes(x = Sepal.Width)) +
  geom_histogram(binwidth = 0.3, color = "white", aes(fill=Species)) +
  labs(x = "Sepal Width",
       y = "Frequency",
       title = "Histogram of Sepal Width")

# petal length
ggplot(irisDF, aes(x = Petal.Length)) +
  geom_histogram(binwidth = 0.3, color = "white", aes(fill=Species)) +
  labs(x = "Petal Length",
       y = "Frequency",
       title = "Histogram of Petal Length")

# petal width
ggplot(irisDF, aes(x = Petal.Width)) +
  geom_histogram(binwidth = 0.3, color = "white", aes(fill=Species)) +
  labs(x = "Petal Width",
       y = "Frequency",
       title = "Histogram of Petal Width")

# Preparing to train the model
library(e1071)
library(caret)
library(caTools)
library(lattice)

# Splitting the data into training and testing sets
split_ration <- sample.split(irisDF, SplitRatio = 0.75)
training_set <- subset(irisDF, split_ration == TRUE)
testing_set <- subset(irisDF, split_ration == FALSE)
dim(training_set)
dim(testing_set)

# Feature Selection
training_dataset1 <- scale(training_set[, 1:4])
testing_dataset1 <- scale(testing_set[, 1:4])

# Training the model using naive Baye's
set.seed(100)
model <- naiveBayes(Species ~ ., data = training_set)

# Testing the model using testing dataset
summary(testing_dataset1)
predicted_results <- predict(model, newdata=testing_set)

# Evaluvate / Examine our results, we're using confusion matrix
matrix <- table(testing_set$Species, predicted_results)
confusionMatrix(matrix)

# import csv form data sets folder
library('here')
liver_cancer <- read.csv(here("Datasets", "cancer_patient_data_sets.csv"))

# Remove unwanted columns index patient_id
liver_cancer <- liver_cancer[, -1]
liver_cancer <- liver_cancer[, -1]

# Splitting the data into training and testing sets
split_ration <- sample.split(liver_cancer, SplitRatio = 0.75)
training_set <- subset(liver_cancer, split_ration == TRUE)
testing_set <- subset(liver_cancer, split_ration == FALSE)
dim(training_set)
dim(testing_set)

# Training the model using naive Baye's
set.seed(100)
model <- naiveBayes(Level ~ ., data = training_set)

# Testing the model using testing dataset
summary(testing_set)
predicted_results <- predict(model, newdata=testing_set)

# Evaluvate / Examine our results, we're using confusion matrix
matrix <- table(testing_set$Level, predicted_results)
confusionMatrix(matrix)

# plot Alcohol.usage vs. Level
ggplot(liver_cancer, aes(x = Alcohol.use, y = Level, color = Level)) +
  geom_point() +
  labs(x = "Alcohol Usage",
       y = "Level",
       title = "Scatter Plot of Alcohol Usage and Level")