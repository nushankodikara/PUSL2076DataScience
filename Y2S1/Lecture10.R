data <- iris

head(data)

library(ggplot2)

ggplot(data, aes(Sepal.Length,Sepal.Width))+geom_point(aes(col=Species),size=3)
ggplot(data, aes(Petal.Length,Petal.Width))+geom_point(aes(col=Species),size=3)

set.seed(150)

cluster_results <- kmeans(data[,1:4], centers = 3, nstart = 25)

cluster_results

table(cluster_results$cluster, data$species)

library(cluster)
clusplot(iris,cluster_results$cluster, color = T, shade = T, labels = 0,lines = 0)

library(here)

stData <- read.csv(here("Datasets", "student_portuguese_clean.csv"))

summary(stData)

# Ommit null values
stData <- na.omit(stData)

# Factorize the variables school, sex, address_type, family_size, parent_status, mother_education, father_education, mother_job, father_job, school_choice_reason, guardian, travel_time, study_time, school_support, family_support, extra_paid_classes, activities, nursery_school, higher_ed, internet_access, romantic_relationship
stData$school <- as.factor(stData$school)
stData$sex <- as.factor(stData$sex)
stData$address_type <- as.factor(stData$address_type)
stData$family_size <- as.factor(stData$family_size)
stData$parent_status <- as.factor(stData$parent_status)
stData$mother_education <- as.factor(stData$mother_education)
stData$father_education <- as.factor(stData$father_education)
stData$mother_job <- as.factor(stData$mother_job)
stData$father_job <- as.factor(stData$father_job)
stData$school_choice_reason <- as.factor(stData$school_choice_reason)
stData$guardian <- as.factor(stData$guardian)
stData$travel_time <- as.factor(stData$travel_time)
stData$study_time <- as.factor(stData$study_time)
stData$school_support <- as.factor(stData$school_support)
stData$family_support <- as.factor(stData$family_support)
stData$extra_paid_classes <- as.factor(stData$extra_paid_classes)
stData$activities <- as.factor(stData$activities)
stData$nursery_school <- as.factor(stData$nursery_school)
stData$higher_ed <- as.factor(stData$higher_ed)
stData$internet_access <- as.factor(stData$internet_access)
stData$romantic_relationship <- as.factor(stData$romantic_relationship)

# Remove all text columns
sdat <- subset(stData, select = -c(school, sex, address_type, family_size, parent_status, mother_education, father_education, mother_job, father_job, school_choice_reason, guardian, travel_time, study_time, school_support, family_support, extra_paid_classes, activities, nursery_school, higher_ed, internet_access, romantic_relationship))

ggplot(stData, aes(weekday_alcohol,social))+geom_point(aes(col=final_grade),size=3)

sdat <- stData[2:31]

cluster <- kmeans(sdat[2:10], centers = 2, nstart = 50)

cluster

table(cluster$cluster, stData$sex)

clusplot(stData,cluster$cluster, color = T, shade = T, labels = 0,lines = 0)
