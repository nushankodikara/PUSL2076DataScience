# Handling Outliers
data <- mtcars
data$disp

boxplot(data$disp, main = "Boxplot of displacement", ylab = "disp")

data$disp[which(data$disp>420)]<- c(data$disp[which(data$disp>420)]*2)
data$disp

boxplot(data$disp, main = "Boxplot of displacement", ylab = "disp")
outliers <- boxplot(data$disp, plot = FALSE)$out
outliers

data[which(data$disp %in% outliers),]

# Removing Rows

newdata <- data[which(!data$disp %in% outliers),]
newdata <- data[-which(data$disp %in% outliers),]
newdata

boxplot(newdata$disp, main = "Boxplot of displacement", ylab = "disp")

