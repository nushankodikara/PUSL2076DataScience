aq <- (airquality)

View(aq)

head(aq)
tail(aq)

summary(aq)

# Box plot to visualize the distribution of the data of Ozone
boxplot(aq$Ozone, ylab = "Ozone")

# Customizing Box Plot
boxplot(x=aq$Ozone, ylab = "Ozone", main = "Mean Ozone in parts per billion at Roosevelt Island",
        col = "red", border = "black", horizontal = TRUE, notch = TRUE,
        names = "Ozone")

# Create a boxplot to display the temperature for each month
boxplot(Temp~Month, data = aq, ylab = "Temperature", main = "Temperature by Month", col="red", border = "black")

# Question 01
a <- c(1,7,5,10,20,8,4)
summary(a)
boxplot(a, horizontal = TRUE)