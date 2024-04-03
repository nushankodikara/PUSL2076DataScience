library(here)
library(caTools)
library(e1071)
library(lattice)
library(caret)

sData <- read.csv(here("Datasets", "student_portuguese_clean.csv"))
sData$final_grade <- as.factor(sData$final_grade)
summary(sData)

# Data Preprocessing

# 1. Removing unnecessary columns (student_id, school_choice_reason)
sData <- subset(sData, select = -c(student_id, school_choice_reason, absences, health, address_type, family_size, school, parent_status, class_failures, school_support, family_support, internet_access ))

# 2. Check and Ommit missing values as percentage
colSums(is.na(sData))
sum(is.na(sData))
sData <- na.omit(sData)

# 3. OneHot Encoding categorical data
my_formula <- as.formula(paste("final_grade ~ .", collapse = " + "))
dummy_model <- dummyVars(my_formula, data = sData)
enc_sData <- predict(dummy_model, newdata = sData)


# Building the Model

# 1. Splitting the data into training and testing sets
set.seed(100)
split <- sample.split(sData$final_grade, SplitRatio = 0.7)
train <- subset(sData, split == TRUE)
test <- subset(sData, split == FALSE)

dim(train)
dim(test)

# 2. Building the model
model <- naiveBayes(final_grade ~ ., data = train)

# 3. Predicting the test set results
predictions <- predict(model, test)

# 4. Making the confusion matrix
cm <- table(test$final_grade, predictions)
confusionMatrix(cm)

