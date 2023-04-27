library(tidyverse)
diet <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")

diet <- diet %>%
  mutate(weight.loss = weight6weeks - pre.weight,
         Dietf = factor(Diet, labels = LETTERS[1:3]))

aov_model <- aov(weight.loss ~ Dietf, diet)
summary(aov_model)
pairwise.t.test(diet$weight.loss, diet$Dietf,
                p.adjust.method = "bonferroni")

pairwise.t.test(diet$weight.loss, diet$Dietf,
                p.adjust.method = "bonferroni", pool.sd = FALSE)

TukeyHSD(aov_model)

summary(lm(weight.loss ~ Dietf, diet))

aov_model_fct <- aov(weight.loss ~ Dietf * as.factor(gender), data = diet)
summary(aov_model_fct)
TukeyHSD(aov_model_fct)

# Picture -----------------------------------------------------------------



diet <- diet %>%
  mutate(genderf = factor(gender, labels = c("ж", "м"))) #превращаем в бинарную переменную в фактор

sem <- function(x) sd(x)/sqrt(length(x)) #пишем функцию для стандартной ошибки
pd = position_dodge(0.05) #немного раздвигаем положение точек на будущем графике

diet %>%
  group_by(Dietf, genderf) %>%
  summarise(meanloss = mean(weight.loss),
            se = sem(weight.loss)) %>%
  ggplot(aes(x = Dietf,
             y = meanloss,
             colour = genderf)) +
  geom_line(aes(group = genderf), position = pd) +
  geom_pointrange(aes(ymin = meanloss - se,
                      ymax = meanloss + se), position = pd) +
  theme_minimal()

dietlongc <- diet %>%
  pivot_longer(cols = c(pre.weight, weight6weeks),
               values_to = "weight",
               names_to = "time") %>%
  filter(Dietf == "C")


install.packages("ez")

library(ez)

ezANOVA(data = dietlongc,
        wid = Person,
        dv = weight,
        within = time)
