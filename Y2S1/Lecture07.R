library(ISLR) # Orange juice dataset
library(caret) # Workflow
library(rpart.plot) # Draw Decision Tree
library(tidyverse)
library(skimr) # Summary Skewness
library(caTools)

# Setting the Dataset
dataset <- OJ
head(dataset)
summary(dataset)
# skim_to_wide(dataset) # Old function
skim(dataset) # New funciton

# Training data & Testing data
split <- sample.split(dataset$Purchase, SplitRatio = 0.8)
train <- subset(dataset, split == TRUE)
test <- subset(dataset, split == FALSE)
dim(test)
dim(train)

# Classifier
set.seed(15000)

dec_tree <- rpart(formula = Purchase ~ .,
                  data = train,
                  method = "class",
                  xval = 10 )

# Drawing the tree
rpart.plot(dec_tree, yesno = TRUE)

# Confusion Matrix
pred <- predict(dec_tree, newdata = test, type = "class")
cm <- table(test$Purchase, pred)
confusionMatrix(cm)
