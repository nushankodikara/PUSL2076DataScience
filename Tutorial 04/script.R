dataset <- airquality
# Overview of the dataset
str(dataset)
# Total Missing Values
sum(is.na(dataset))
# Total Missing Values in each column
colSums(is.na(dataset))

dim(dataset)

# Remove all rows with missing values
dataset_clean <- na.omit(dataset)
dim(dataset_clean)
sum(is.na(dataset_clean))

# Removing a column
# [, meanse consider all the rows (Not name wind)
dataset_nowind <- dataset[, !(names(dataset) == "Wind")]
str(dataset_nowind)


