df <- data.frame(
  city=c('colombo', 'kandy', 'galle', 'kandy', 'colombo', 'kandy'),
  salary=c(1000,2000,3000,2000,1000,2000)
)

label_encoded <- df
one_hot_encoded <- df
one_hot_encoded2 <- df

# label encoding
label_encoded$city <- as.numeric(factor(label_encoded$city))
label_encoded

# one-hot encoding
one_hot_encoded <- cbind(one_hot_encoded, model.matrix(~city-1, data=one_hot_encoded))
one_hot_encoded

one_hot_encoded2$city <- model.matrix(~df$city-1,df)
one_hot_encoded2