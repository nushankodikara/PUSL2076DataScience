# Import Dataset
data('mtcars')
mtcarsDF <- data.frame(mtcars)

# Overview of dataset
head(mtcarsDF)
summary(mtcarsDF)
tail(mtcarsDF)

# Scatter plot of mpg vs. wt
library(ggplot2)

plot(mtcarsDF$wt, mtcarsDF$mpg,
     xlab = "Weight",
     ylab = "Miles per Gallon",
     main = "Scatter Plot of Weight and Miles per Gallon",
     pch = 19,
     col = "blue")

ggplot(mtcarsDF, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(x = "Weight",
       y = "Miles per Gallon",
       title = "Scatter Plot of Weight and Miles per Gallon")

# Scatter plot of mpg vs. wt with regression line
plot(mtcarsDF$wt, mtcarsDF$mpg,
     xlab = "Weight",
     ylab = "Miles per Gallon",
     main = "Scatter Plot of Weight and Miles per Gallon",
     pch = 19,
     col = "blue") +
  abline(lm(mpg ~ wt, data = mtcarsDF), col = "red") +
  lines(lowess(mtcarsDF$wt, mtcarsDF$mpg), col = "green")

ggplot(mtcarsDF, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", color="red") +
  geom_line(stat = "smooth", method = "loess", col = "green") +
  labs(x = "Weight",
       y = "Miles per Gallon",
       title = "Scatter Plot of Weight and Miles per Gallon")

# Creating a density plot for mpg with a red line
plot(density(mtcarsDF$mpg),
     main = "Density Plot of Miles per Gallon",
     xlab = "Miles per Gallon",
     col = "red")

ggplot(mtcarsDF, aes(x = mpg)) +
    geom_density(color = "red") +
    labs(x = "Miles per Gallon",
         title = "Density Plot of Miles per Gallon")