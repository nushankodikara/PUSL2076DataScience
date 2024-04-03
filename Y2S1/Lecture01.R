# Variables
name <- "Nushan"
age <- 22

# Printing Out
name
age

# Checking Class names
class(name)
class(age)

# Inputs
x <- readline(prompt = "Enter a number: ")
class(x)

# Converting to Numeric
x <- as.numeric(x)
class(x)

# If Else Statements
marks <- x

if (marks >= 75) {
  print("Pass: A")
} else if (marks >= 65) {
  print("Pass: B")
} else if (marks >= 55) {
  print("Pass: C")
} else if (marks >= 45) {
  print("Pass: S")
} else {
  print("Fail")
}

# While Loop
i <- 0
while (i < marks){
  print(paste("i = ", i))
  i <- i + 1
}