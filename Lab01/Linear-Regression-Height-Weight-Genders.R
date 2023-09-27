library('ggplot2')
library('here')
data <- read.csv(here('Datasets','01_heights_weights_genders1.csv'))
summary(data)

ggplot(data, aes(x = Height, y = Weight, color = Gender)) +
  geom_point() +
  labs(title = "Scatter Plot of Height vs. Weight by Gender", x = "Height (in)", y = "Weight (lbs)") +
  scale_color_manual(values = c("Male" = "blue", "Female" = "pink")) +
  theme_minimal()

# 5.Coefficients

fitted.regression <- lm(Weight ~ Height, data = data)
coef(fitted.regression)