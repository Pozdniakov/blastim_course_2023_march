library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99"))

heroes_pub_gender <- heroes %>%
  filter(Publisher %in% c("Marvel Comics", "DC Comics")) %>%
  select(Gender, Publisher) %>%
  drop_na()

heroes_pub_gender %>%
  count(Gender, Publisher)

heroes_pub_gender %>%
  table() %>%
  summary()

chisq.test(heroes_pub_gender$Gender,
           heroes_pub_gender$Publisher, correct = FALSE
           )

heroes_pub_gender %>%
  table() %>%
  fisher.test()

heroes_pub_gender %>%
  table() %>%
  mosaicplot(shade = TRUE)
