dnorm(0)
dnorm(1)
dnorm(-1)
dnorm(3)
dnorm(-3)
vec <- seq(-3, 3, by = .1)
vec
dnorm(vec)
plot(vec, dnorm(vec))

iq <- seq(50, 150, by = .1)
dnorm(iq, mean = 100, sd = 15)
plot(iq, dnorm(iq, mean = 100, sd = 15))

pnorm(100, mean = 100, sd = 15)
pnorm(130, mean = 100, sd = 15)
pnorm(95, mean = 100, sd = 15)
plot(iq, pnorm(iq, mean = 100, sd = 15))

set.seed(42)
rnorm(30, mean = 100, sd = 15)

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
hist(samp)
hist(rnorm(10000, mean = 100, sd = 15))
hist(rnorm(20, mean = 100, sd = 15))
mean(samp)
mean(rnorm(1000000, mean = 100, sd = 15))

sd(samp)

sample_means <- replicate(1000000,
          mean(rnorm(100, mean = 100, sd = 15)))
hist(sample_means)
mean(sample_means)
sd(sample_means)
15 / sqrt(100)

samp_se <- sd(samp)/sqrt(length(samp))
mean(samp) - 1.96 * samp_se
mean(samp) + 1.96 * samp_se

hist(rlnorm(1000), breaks = 100)

sample_log_means <- replicate(10000,
                          mean(rlnorm(10000)))
hist(sample_log_means, breaks = 100)

z <- (mean(samp) - 100)/(15/sqrt(length(samp)))

1 - pnorm(z)
(1 - pnorm(z)) * 2

t <- (mean(samp) - 100)/(sd(samp)/sqrt(length(samp)))

(1 - pt(t, df = length(samp) - 1)) * 2

t.test(samp, mu = 100, alternative = "greater")

t_samp <- t.test(samp, mu = 100)
str(t_samp)
t_samp$p.value

install.packages("apa")
library(apa)
apa::t_apa(t_samp, format = "docx")

library(tidyverse)
diet <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")

diet1 <- diet %>%
  filter(Diet == 1)

options(scipen = 999)
t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

diet2 <- diet %>%
  filter(Diet == 2)
t.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)
#t.test(diet2$pre.weight, diet2$weight6weeks, paired = FALSE)

diet12 <- diet %>%
  filter(Diet %in% 1:2)

t.test(diet12$weight6weeks ~ diet12$Diet,
       paired = FALSE, var.equal = TRUE)

diet %>%
  group_by(Diet) %>%
  summarise(m = mean(weight6weeks),
            sd = sd(weight6weeks))

t.test(weight6weeks ~ Diet, data = diet12,
       paired = FALSE, var.equal = TRUE)

diet1after <- diet %>%
  filter(Diet == 1) %>%
  pull(weight6weeks)

diet2after <- diet %>%
  filter(Diet == 2) %>%
  pull(weight6weeks)

t.test(diet1after, diet2after, paired = FALSE, var.equal = TRUE)

diet %>%
  filter(Diet %in% 1:2) %>%
  select(weight6weeks, Diet) %>% View()

shapiro.test(samp)

shapiro.test(diet1after)
shapiro.test(diet2after)

qqnorm(diet1after)
qqnorm(diet2after)
qqnorm(samp)

hist(diet1after)
hist(diet2after)
hist(rnorm(25))

car::qqPlot(rnorm(25))

wilcox.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

t.test(diet1after, diet2after, paired = FALSE, var.equal = TRUE)
wilcox.test(diet1after, diet2after, paired = FALSE)

a <- 1:4 + rnorm(4, sd = .2)
b <- 100:103 + rnorm(4, sd = .2)
t.test(a, b, paired = TRUE)
wilcox.test(a, b, paired = TRUE)
wilcox.test(a, b, paired = FALSE)
t.test(a, b, paired = FALSE, var.equal = TRUE)
