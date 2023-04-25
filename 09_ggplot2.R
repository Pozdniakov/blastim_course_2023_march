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

eyes <- c("green", "green", "blue", "brown", "blue", "blue")
eyes_factor <- as.factor(eyes)
as.numeric(eyes_factor)
as.character(eyes_factor)
str(eyes_factor)
fct_infreq(eyes)

skin_colours <- heroes %>%
  mutate(`Skin color` =
           `Skin color` %>%
           fct_infreq() %>%
           fct_lump_n(n = 7) %>%
           fct_rev()) %>%
  count(`Skin color`, sort = TRUE) %>%
  drop_na()


ggplot(data = skin_colours,
       aes(y = n,
           yend = 0,
           x = `Skin color`,
           xend = `Skin color`)) +
  geom_segment(size = 3, colour = "orange") +
  geom_point(shape = "♥", size = 7, colour = "#DD22AA") +
  coord_flip()

ggplot(data = skin_colours,
       aes(y = n,
           yend = 0,
           x = `Skin color`,
           xend = `Skin color`)) +
  #geom_line(group = 1, colour = "#DDBB50", size = 2) +
  geom_segment(size = 3, colour = "orange") +
  geom_point(shape = "♥", size = 7, colour = "#DD22AA") +
  coord_polar(theta = "y")

ggplot(data = skin_colours) +
  geom_col(aes(y = n, x = "", fill = `Skin color`)) +
  coord_polar(theta = "y")

ggplot(data = skin_colours) +
  geom_col(aes(y = n, x = `Skin color`, fill = `Skin color`)) +
  coord_polar(theta = "x")

ggplot(data = skin_colours %>%
         filter(!`Skin color` %in% c("Other", "silver"))) +
  geom_col(aes(y = n, x = `Skin color`, fill = `Skin color`)) +
  scale_fill_brewer(palette = "Set1")

ggplot(data = skin_colours %>%
         filter(!`Skin color` %in% c("Other", "silver"))) +
  geom_col(aes(y = n, x = `Skin color`, fill = `Skin color`)) +
  scale_fill_identity()


ggplot(data = heroes) +
  geom_bar(aes(x = Gender, fill = Gender)) +
  scale_fill_brewer(palette = "Set1")

heroes %>%
  drop_na(Alignment, Gender) %>%
  ggplot() +
  geom_point(aes(x = Height,
                 y = Weight,
                 size = Weight,
                 colour = Weight),
             alpha = .7,
             shape = "♥") +
  scale_x_log10() +
  #scale_y_log10() +
  scale_size_area(max_size = 4.5) +
  scale_colour_viridis_c() +
  facet_wrap(Alignment ~ Gender, ncol = 3) +
  theme_linedraw()

ggplot(data = heroes %>% drop_na(Gender)) +
  geom_bar(aes(x = Gender, fill = Gender)) +
  scale_fill_brewer(palette = "Set1") +
  labs(title = "Распределение супергероев по полу",
       subtitle = "Мужчин супергероев больше чем женщин",
       x = "Пол супергероев",
       y = "Количество",
       fill = "Пол супергероев") +
  guides(fill = "none") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

install.packages("hrbrthemes")

ggplot(data = heroes %>% drop_na(Gender)) +
  geom_bar(aes(x = Gender, fill = Gender)) +
  scale_fill_brewer(palette = "Set1") +
  labs(title = "Распределение супергероев по полу",
       subtitle = "Мужчин супергероев больше чем женщин",
       x = "Пол супергероев",
       y = "Количество",
       fill = "Пол супергероев") +
  guides(fill = "none") +
  hrbrthemes::theme_ipsum()

ggplot(data = skin_colours,
       aes(y = n,
           yend = 0,
           x = `Skin color`,
           xend = `Skin color`)) +
  #geom_line(group = 1, colour = "#DDBB50", size = 2) +
  geom_segment(size = 3, colour = "orange") +
  geom_point(shape = "♥", size = 7, colour = "#DD22AA") +
  labs(title = "Skin colors of superheroes",
       y = "number of superheroes") +
  hrbrthemes::theme_ft_rc()
