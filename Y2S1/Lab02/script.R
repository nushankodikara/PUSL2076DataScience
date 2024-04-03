library("ggplot2")
library("here")

data <- read.csv(here("Lab02", "heart_disease.csv"))

# Scatterplot of Age vs Resting Blood Pressure and Cholesterol
ggplot(data, aes(x=age, y=resting_blood_pressure, color=serum_cholestoral)) +
  geom_point() + geom_smooth(method = lm, se = FALSE) +
  labs(x="Age", y="Resting Blood Pressure")

rbp.lrm <- lm(resting_blood_pressure ~ age, data=data)
coef(rbp.lrm)
