#Vector
(profitsv <- c(2,4,6,81,10))
profitsv[1]
length(profitsv)
sort(profitsv)

#List
(profitsl <- list(2,4,6,"Hello",10,8.23))
profitsl[1]
length(profitsl)

#Matrix
(profitsm <- matrix(c(2,4,6,81,10,8.23,65,34), nrow = 2))
profitsm[1,1]

#Data Frame
profitsdf <- data.frame(M_ID = c("M1","M2","M3","M4","M5","M6","M7","M8"),Interval = c(2,4,6,81,10,8.23,65,34))
print(profitsdf)

summary(profitsdf)