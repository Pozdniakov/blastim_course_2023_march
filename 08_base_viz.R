library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99"))

plot(heroes$Height, heroes$Weight)
plot(heroes$Weight)
plot(iris[, -5])
hist(heroes$Weight)
hist(heroes$Weight, breaks = 30)
hist(heroes$Weight, breaks = 100)

boxplot(Weight ~ Gender, heroes)
