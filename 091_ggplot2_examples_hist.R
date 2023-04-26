library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99"))

ggplot(heroes) +
  geom_histogram(aes(x = Weight), fill = "purple")

ggplot(heroes) +
  geom_histogram(aes(x = Weight, fill = Gender))

ggplot(heroes) +
  geom_histogram(aes(x = Weight, fill = Gender),
                 position = "identity",
                 alpha = .5)

ggplot(heroes) +
  geom_density(aes(x = Weight), fill = "purple",
                 position = "identity",
                 alpha = .5, adjust = 2) +
  coord_flip()
