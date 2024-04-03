library(here)
library(ggplot2)
library(lubridate)
library(reshape)

prices <- read.csv(here("Y2S2", "Datasets", "stock_prices.csv"))
summary(prices)
head(prices)

prices[1,]

# Transform date format
prices <- transform(prices, Date = ymd(Date))
head(prices)

# Ommit missing values
prices <- na.omit(prices)

# 1. Reshape the data
date.stock.matrix <- cast (prices, Date ~ Stock, value = "Close")
head(date.stock.matrix)
summary(date.stock.matrix)

# Remove Missing Entries
prices <- subset(prices, Date != ymd('2002-02-01'))
prices <- subset(prices, Stock != 'DDR')
date.stock.matrix <- cast(prices, Date ~ Stock, value = 'Close') 

# 2. Correlation
cor.matrix <- cor(date.stock.matrix[, 2:ncol(date.stock.matrix)])
correlations <- as.numeric(cor.matrix)

ggplot(data.frame(Correlation = correlations), aes(x = Correlation, fill = 1)) + geom_density() +
  theme(legend.position = 'none') 

# 3. PCA
pca <- princomp(date.stock.matrix[, 2:ncol(date.stock.matrix)]) 
pca

principal.component <- pca$loadings[, 1]
loadings <- as.numeric(principal.component)
ggplot(data.frame(Loading = loadings),
       aes(x = Loading, fill = 1)) +
  geom_density() +
  theme(legend.position = 'none')

# 4. Prediction

market.index <- predict(pca)[, 1] 

dji.prices <- read.csv(here("Y2S2", "Datasets", "DJI.csv"), stringsAsFactors =
                         FALSE)
dji.prices <- transform(dji.prices, Date = ymd(Date))

dji.prices <- subset(dji.prices, Date > ymd('2001-12-31'))
dji.prices <- subset(dji.prices, Date != ymd('2002-02-01')) 

dji <- with(dji.prices, rev(Close))
dates <- with(dji.prices, rev(Date)) 

comparison <- data.frame(Date = dates,
                         MarketIndex = market.index,
                         DJI = dji)

ggplot(comparison, aes(x = MarketIndex, y = DJI)) + geom_point() + geom_smooth(method =
                               'lm', se = FALSE) 

# Generally in this graph it has a positive correlation. 
# Between the markt index and the DJI values. But the negative 
# value seems spreads beyond the linear line in both directions 
# Values from 30 to 45 seems to be the strongest correlated values.