# Covid data table
df <- data.frame(
  id=c(1,2,3,4,5,6,7,8,9,10),
  cold=c("No","No","No","No","Yes","Yes","Yes","Yes","Yes","Yes"),
  temperature=c("Normal", "High", "High", "Very High", "Normal", "Normal","High","High","Very High","Very High"),
  fatigue=c("No", "Yes", "Yes", "Yes", "No", "Yes","No","Yes","No","Yes"),
  results=c("Negative", "Negative", "Positive", "Positive", "Negative","Positive","Negative","Positive","Positive", "Positive")
)

summary(df)

