# Handling Missing Values
# Imputing Missing Values

# 1. Mean Imputation
data <- c(100,200,300,300,NA)
data[is.na(data)] <- mean(data, na.rm = TRUE)
data

# 2. Median Imputation
data <- c(100,200,300,300,NA)
data[is.na(data)] <- median(data, na.rm = TRUE)
data

# 3. Mode Imputation
data <- c(100,200,300,300,NA)
data[is.na(data)] <- as.numeric(names(which.max(table(data))))
data

# Creating a data frame with missing values
df <- data.frame(
  x = c(100,200,300,300,NA),
  y = c(100,200,300,300,NA),
  z = c(100,200,300,300,NA)
)
df

df$x[is.na(df$x)] <- mean(df$x, na.rm = TRUE)
df$y[is.na(df$y)] <- median(df$y, na.rm = TRUE)
df$z[is.na(df$z)] <- as.numeric(names(which.max(table(df$z))))

# Using air quality dataset

data <- airquality

colSums(is.na(data))

data$Ozone[is.na(data$Ozone)] <- mean(data$Ozone, na.rm = TRUE)
data$Solar.R[is.na(data$Solar.R)] <- median(data$Solar.R, na.rm = TRUE)