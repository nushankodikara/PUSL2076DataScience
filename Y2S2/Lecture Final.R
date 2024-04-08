# Load necessary libraries
library(here)
library(bupaR) # For process mining 
library(eventdataR) # For event log data manipulation
library(processmapR) # For process map visualization
library(edeaR) # For event data analysis
library(dplyr) # For data manipulation

# Read the dataset
dataset <- read.csv(here("Y2S2", "Datasets", "Insurance_claims_event_log.csv"))

# Convert timestamp into POSIXct format
dataset$timestamp <- as.POSIXct(dataset$timestamp, format = "%Y-%m-%d %H:%M:%OS")

# Check for NA values in timestamp and remove rows if any
dataset <- dataset[!is.na(dataset$timestamp), ]

# Creating event log: arrange, group, mutate, then ungroup
dataset <- dataset %>%
  arrange(case_id, timestamp) %>%
  group_by(case_id) %>%
  mutate(activity_instance_id = paste(case_id, activity_name, row_number(), sep = "_")) %>%
  ungroup()

# Adding a column for resource ID (filled with NA for compatibility)
dataset$resource_id <- NA

# Create the event log object
event_log <- eventlog(dataset, 
                      case_id = "case_id", 
                      activity_id = "activity_name", 
                      timestamp = "timestamp",
                      lifecycle_id = "user_type",
                      resource_id = "resource_id",
                      activity_instance_id = "activity_instance_id")

# Before drawing the process map, ensure there are no missing or infinite values
if(any(is.na(event_log$timestamp)) || any(is.infinite(event_log$timestamp))) {
  stop("The event log contains NA or infinite timestamps, which cannot be processed.")
}

# Drawing the process map
process_map(event_log, performance(median))

# Before Creating the final event log we will include another column called resource ID by filling NA for all the rows to ensure compatibility

# Logistic Regression
# KNN
# Web Mining
# Process Mining

# 24 Submission Data ( Research Paper )