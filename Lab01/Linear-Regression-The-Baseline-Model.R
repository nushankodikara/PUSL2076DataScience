library('ggplot2')
library('here')
data <- read.csv(here('Datasets','longevity.csv'))
summary(data)

ggplot(data, aes(x=AgeAtDeath, fill = factor(Smokes))) +
  geom_density() + facet_grid(Smokes ~ .)
