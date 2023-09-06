i <- as.integer(readline(prompt = "Enter a number: "))

fact <- 1

while(i > 0){
  fact <- fact * i
  i <- i - 1
}

print(paste("Factorial: ", fact))