library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99"))


# GLM ---------------------------------------------------------------------

heroes$good <- heroes$Alignment == "good"
heroes_good_glm <- glm(good ~ Weight + Gender, heroes, family = binomial())
summary(heroes_good_glm)

heroes_good_glm_noweight <- glm(good ~ Gender, heroes, family = binomial())
summary(heroes_good_glm_noweight)


# LME ---------------------------------------------------------------------

install.packages("lme4")

library(lme4)

data("sleepstudy")

sleepstudy %>%
  ggplot(aes(x = Days, y = Reaction)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks = 0:9) +
  facet_wrap(~Subject) +
  theme_minimal()

sleep_lme0 <- lmer(Reaction ~ Days + (1 | Subject), sleepstudy)
sleep_lme1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

sleepstudy$predicted_by_sleep_lme0 <- predict(sleep_lme0)
sleepstudy$predicted_by_sleep_lme1 <- predict(sleep_lme1)

sleepstudy %>%
  rename(observed_reaction_time = Reaction) %>%
  pivot_longer(cols = c(observed_reaction_time, predicted_by_sleep_lme0, predicted_by_sleep_lme1), names_to = "model", values_to = "Reaction") %>%
  ggplot(aes(x = Days, y = Reaction)) +
  geom_line(aes(colour = model)) +
  geom_point(data = sleepstudy, alpha = 0.4) +
  scale_x_continuous(breaks = 0:9) +
  facet_wrap(~Subject) +
  theme_minimal()

anova(sleep_lme0, sleep_lme1)


# k-means -----------------------------------------------------------------

data(iris)
iris
plot(iris[, -5], col=iris$Species)
iris <- iris %>%
  mutate(across(where(is.numeric), scale))
kmeans(iris[,-5], centers = 3)

iris_3means <- kmeans(iris[,-5], centers = 3)
iris$cluster <- iris_3means$cluster

table(iris$Species, iris$cluster)

# Задание: сделать k-means (k = 3) кластерный анализ для пингвинов
# Переменные:
# bill_length_mm,
# bill_depth_mm,
# flipper_length_mm,
# body_mass_g

penguins <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/penguins.csv")

# PCA ---------------------------------------------------------------------

data(iris)
plot(iris %>% select(!Species), col=iris$Species)

iris %>%
  select(!Species) %>%
  plot(col = iris$Species)

iris_pr <- iris %>%
  select(!Species) %>%
  prcomp(center = TRUE, scale. = TRUE)

class(iris_pr)
str(iris_pr)

plot(iris_pr$x[, 1:2], col = iris$Species)

install.packages("factoextra")

library(factoextra)
fviz_pca_biplot(iris_pr,
                repel = TRUE)


# t-SNE -------------------------------------------------------------------

mnist_small <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/mnist_small.csv")

mnist_pca <- mnist_small %>%
  select(!label) %>%
  select(where(function(x) !all(x == 0))) %>%
  prcomp(center = TRUE, scale. = TRUE)

pca_df <- mnist_pca$x[, 1:2] %>%
  as_tibble() %>%
  bind_cols(mnist_small$label) %>%
  slice_sample(prop = .2)

names(pca_df) <- c("x", "y", "label")
pca_df %>%
  ggplot() +
  geom_text(aes(x = x,
                y = y,
                label = label,
                colour = as.factor(label))) +
  guides(colour = "none") +
  theme_minimal()

install.packages("Rtsne")
library(Rtsne)
tsne <- mnist_small %>%
  select(!label) %>%
  Rtsne(dims = 2, perplexity=30, verbose=TRUE, max_iter = 1000)

tsne_df <- bind_cols(tsne$Y, mnist_small$label)

names(tsne_df) <- c("x", "y", "label")

tsne_df %>%
  slice_sample(prop = .2) %>%
  ggplot() +
  geom_text(aes(x = x,
                y = y,
                label = label,
                colour = as.factor(label))) +
  guides(colour = "none") +
  theme_minimal()

