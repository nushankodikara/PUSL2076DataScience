library(here)
library(ggplot2)
library(caTools)
library(caret)

df <- read.csv(here("Y2S2","Datasets", "admissions.csv"))
head(df)
summary(df)

ggplot(df, aes(x=gpa, y=admitted, color=admitted)) +
  geom_jitter(height=0.05, alpha=0.1) + labs(x="GPA", y="Admitted") + theme_minimal()

# Generalized Linear Model - Logistic Regression
model <- glm(admitted ~ gpa, data = df, family = "binomial") 
summary(model)

ggplot(df, aes(x=gpa, y=admitted, color=admitted)) +
  geom_jitter(height=0.05, alpha=0.1) + 
  geom_smooth(method="glm", method.args=list(family="binomial"), se=FALSE) +
  labs(x="GPA", y="Admitted") + theme_minimal()

df2 <- read.csv(here("Y2S2","Datasets", "diabetesmodel.csv"))
head(df2)
summary(df2)

# check for missing values
sum(is.na(df2))

# Generalized Linear Model - Logistic Regression
model2 <- glm(Outcome ~ Pregnancies + Glucose + BloodPressure + SkinThickness + Insulin + BMI + Age, data = df2, family = "binomial")
summary(model2)

# Splitting the data into training and testing
set.seed(1000)
split <- sample.split(df2, SplitRatio = 0.8)
training_set <- subset(df2, split == TRUE)
testing_set <- subset(df2, split == FALSE)

lm_model <- glm(Outcome ~ Pregnancies + Glucose + BloodPressure + SkinThickness + Insulin + BMI + Age, data = training_set, family = "binomial")
summary(lm_model)

# Testing the model using testing dataset
predicted_results <- predict(lm_model, newdata=testing_set, type="response")
predicted_results

# Confusion Matrix
predicted_results <- ifelse(predicted_results > 0.5, 1, 0)
cm <- table(testing_set$Outcome, predicted_results)
confusionMatrix(cm)

