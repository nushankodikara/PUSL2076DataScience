library(ggplot2)
data(iris)

irisDF <- data.frame(iris)

summary(irisDF)

# plot(irisDF$Sepal.Length, irisDF$Sepal.Width, col = irisDF$Species)
ggplot(irisDF, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point() + labs(x = "Sepal Length", y = "Sepal Width", title = "Scatter Plot of Sepal Length and Sepal Width")