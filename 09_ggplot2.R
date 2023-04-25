library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99"))

ggplot() +
  geom_point(data = heroes %>% mutate(imt = Weight/(Height/100)^2),
             aes(x = Height,
                 y = Weight,
                 size = Weight,
                 colour = Alignment),
             alpha = .7,
             shape = "♥")
ggplot() +
  geom_point(data = heroes,
           aes(x = Gender,
               y = Weight
               #size = Weight
               ),
           alpha = .5,
           #shape = "♥",
           position = position_jitter(height = 0,
                                      width = .25))

heroes %>%
  count(Gender) %>%
  ggplot() +
  geom_col(aes(x = Gender, y = n))

heroes %>%
  count(Gender) %>%
  ggplot() +
  geom_bar(aes(x = Gender, y = n),
           stat = "identity")

ggplot() +
  geom_bar(data = heroes,
           aes(x = Gender),
           colour = "#2390DE",
           fill = "#54EFAA")

ggplot() +
  geom_boxplot(data = heroes,
               aes(y = Weight, x = Gender),
               width = .25)

ggplot() +
  geom_violin(data = heroes,
              aes(y = Weight,
                  x = Gender,
                  fill = Gender),
              alpha = .7)

ggplot(data = heroes,
       aes(y = Height,
           x = Gender,
           fill = Gender)) +
  geom_violin(alpha = .7) +
  geom_boxplot(fill = "white", width = .15)


skimr::skim(heroes)

skin_colours <- heroes %>%
  count(`Skin color`, sort = TRUE) %>%
  drop_na()

ggplot(data = skin_colours,
       aes(y = n,
           yend = 0,
           x = `Skin color`,
           xend = `Skin color`)) +
  geom_segment() +
  geom_point(shape = "♥", size = 3)
