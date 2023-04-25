
library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99"))
weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

mean(weight)
sum(weight)/length(weight)

heroes %>%
  count(`Eye color`, sort = TRUE)
mean(weight)
median(weight)
mean(weight, trim = .1)

mean(c(weight, 100000))
median(c(weight, 100000))
mean(c(weight, 100000), trim = .1)

diff(range(weight))
sum((weight - mean(weight)) ^ 2)/length(weight)
var(weight)
sum((weight - mean(weight)) ^ 2)/(length(weight) - 1)

sqrt(sum((weight - mean(weight)) ^ 2)/(length(weight) - 1))
sd(weight)
sd(c(weight, 100000))
IQR(weight)

install.packages("psych")
library(psych)
skew(weight)
kurtosi(weight)

summary(weight)
summary(letters)
summary(heroes)

psych::describe(weight)
heroes %>%
  group_by(Gender) %>%
  summarise(describe(Weight))

install.packages("skimr")

skimr::skim(heroes)

heroes %>%
  group_by(Gender) %>%
  skimr::skim()

xxx
mean(xxx$x)
mean(xxx$y)
skew(xxx$x)
skew(xxx$y)
sd(xxx$x)
sd(xxx$y)
cor(xxx$x, xxx$y)
describe(xxx)
skimr::skim(xxx)

plot(xxx)
