library(here)
library(caret)
library(rpart.plot)
library(tidyverse)
library(skimr)
library(caTools)

# Loading Dataset
data <- read.csv(here("Datasets", "car_evaluation.csv"))

# Renaming Columns
colnames(data) <- c("buying", "maint", "doors", "persons", "lug_boot", "safety", "unacc")

summary(data)
skim(data)

# Splitting and Training
split <- sample.split(data, SplitRatio = 0.8)
training_set <- subset(data, split == TRUE)
testing_set <- subset(data, split == FALSE)

partition <- createDataPartition(data$unacc, p = 0.8, list = FALSE)
training_set2 <- data[partition, ]
testing_set2 <- data[-partition, ]

dim(training_set)
dim(testing_set)

dim(training_set2)
dim(testing_set2)

# Classifier
set.seed(1500)
dec_tree <- rpart(formula = unacc ~ .,
                  data = training_set2,
                  method = "class",
                  xval = 10 )

# Drawing the tree
rpart.plot(dec_tree, yesno = TRUE)

# Confusion Matrix
pred <- predict(dec_tree, newdata = testing_set2, type = "class")
cm <- table(testing_set2$unacc, pred)
confusionMatrix(cm)

