# Task 1: Load the tidyverse library and assign to the variable dataset the mpg dataset
library("tidyverse")
library("tibble")
dataset <- mpg

# Task 2: Display the entire dataset
view(dataset)

# Task 3: Display the first and last five rows
head(dataset)
tail(dataset)

# Task 4: Display an overview of the dataset
summary(dataset)

# Task 5: Create a histogram of frequency of vehicles in the city area (fuel consumption)
hist(dataset$cty)

# Task 6: Customize the histogram using title and color scheme
hist(dataset$cty, main = "City Fuel Consumption", col = "red")

# Task 7: Create another histogram displaying manufacturer and number of vehicles belong to each
manufacturer <- table(dataset$manufacturer) # Frequency table
barplot(manufacturer,
        main = "Manufacturer",
        xlab = "Manufacturer",
        ylab = "Number of Vehicles",
        col = "blue")

# Task 8: Create a pie chart displaying manufacturer and number of vehicles belong to each
pie(manufacturer,
    main = "Manufacturer",
    col = rainbow(length(manufacturer))
)

# Task 9: Create a pie chat for cylinder cound
cyltab <- table(dataset$cyl)
pie(cyltab,
    main = "Cylinder Count"
)

# Task 10: Modifying pie charts
pie(manufacturer,
    main = "Manufactured Cars",
    col = rainbow(length(manufacturer)),
    init.angle = 90,
)
legend("topright",
       names(manufacturer),
       cex = 0.8,
       fill = rainbow(length(manufacturer))
)

