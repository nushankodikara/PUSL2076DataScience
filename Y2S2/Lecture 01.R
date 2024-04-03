data<-data.frame(
  x=c(1,2,3,4),
  y=c(51.2,42.3,1.4,6.3),
  z=c("true","false","false","true")
)

data2<-data.frame(
  x=c(1,12,32,4),
  k=c(152.1,42.1,11.4,6.3),
  j=c("Tom","Smith","Jack","Tim")
)
data
data2



#inner join
join_data<- merge(data,data2, by="x")
join_data

#left join
join_data2<- merge(data,data2, by="x", all.y = TRUE)
join_data2

#right join
join_data3<- merge(data,data2, by="x", all.x = TRUE)
join_data3

#full join
join_data4<- merge(data,data2, by="x", all= TRUE)
join_data4

data3<-data.frame(
  x=c(34,56,67,89),
  y=c(145.1,232.1,197.4,127.3),
  z=c("Tony","mark","sam","shelby")
)



#row bind(column names must match)
merge_data1<-rbind(data,data3)
merge_data1


df <- data.frame(
  height=c(160,170,155,180,175),
  weight=c(60,75,55,85,80),
  age=c(25,30,2,35,28)
)

#standardize the height and weight columns
df$weight_st <- scale(df$weight)
df$height_st <- scale(df$height)