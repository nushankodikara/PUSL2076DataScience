library("ggplot2")
library("here")

data <- read.csv(here("Datasets", "vehicle dataset", "car details v4.csv"))

str(data)
head(data)
summary(data)

# Scatter Plot of Year and Price
ggplot(data, aes(x = Year, y = Price)) + geom_point() + geom_smooth(method = lm, se = FALSE) + labs(x = "Year", y = "Price", title = "Scatter Plot of Year and Price")

# Scatter Plot of prive and km driven
ggplot(data, aes(x= Kilometer, y = Price)) + geom_point() + geom_smooth(method = lm, se = FALSE) + labs(x = "Price", y = "Kilometer", title = "Scatter Plot of prive and km driven")

# Coefficients
fittedssion <- lm(Price ~ Year, data = data)
coef(fittedssion)

# (Intercept)         Year
# -450043130.4     224033.1
# Here we get y=mx+c where y is price, m is (224033.1) and c is (-450043130.4)

# For Linear Regression

kchousing <- read.csv(here("Datasets", "kc_house_data.csv"))
str(kchousing)

# Scatter Plot of sqft_living and price
ggplot(kchousing, aes(x = sqft_living, y = price)) + geom_point() + geom_smooth(method = lm, se = FALSE) + labs(x = "sqft_living", y = "price", title = "Scatter Plot of sqft_living and price")

# Scatter Plot of bedrooms and price
ggplot(kchousing, aes(x = bedrooms, y = price)) + geom_point() + geom_smooth(method = lm, se = FALSE) + labs(x = "bedrooms", y = "price", title = "Scatter Plot of bedrooms and price")

kchousingmodel <- lm(price ~ sqft_living, data = kchousing)
coef(kchousingmodel)

# Price = 280.623(sqft_living) - 43580.7431