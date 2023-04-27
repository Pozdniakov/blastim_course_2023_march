install.packages("Stat2Data")
library(tidyverse)
library(Stat2Data)
data("Backpack")
Backpack

skimr::skim(Backpack)

back <- Backpack %>%
  mutate(backpack_kg = BackpackWeight * 0.453592,
         body_kg = BodyWeight * 0.453592) %>%
  mutate(is_female = as.integer(Sex == "Female"))

back %>%
  select(body_kg, backpack_kg) %>%
  cov()

back %>%
  select(body_kg, backpack_kg) %>%
  var()

cor(back$BackpackWeight, back$backpack_kg)

back %>%
  select(body_kg, backpack_kg) %>%
  cor()

cor.test(back$backpack_kg, back$body_kg)
cor.test(back$backpack_kg, back$body_kg, method = "spearman")
cor.test(back$backpack_kg, back$body_kg, method = "kendall")

plot(back$backpack_kg, back$body_kg)

cor.test(back$backpack_kg, back$BackProblems)
t.test(back$backpack_kg ~ back$BackProblems,
       paired = FALSE,
       var.equal = TRUE)

back %>%
  select(backpack_kg, body_kg, BackProblems,
         Units, is_female, Year) %>%
  cor()

library(psych)

back %>%
  select(backpack_kg, body_kg, BackProblems,
         Units, is_female, Year) %>%
  corr.test()

corr.test(as.data.frame(matrix(rnorm(20 * 100), ncol = 20)))

(20 * 20 - 20) / 2 * .05

back %>%
  select(backpack_kg, body_kg, BackProblems,
         Units, is_female, Year) %>%
  corr.test(adjust = "BH")

p.adjust(seq(.001, .05, by = .001))

mtcars

install.packages("corrplot")
library(corrplot)
cor(mtcars)
#{corrr}
corrplot(cor(mtcars),
         method = "color",
         order = "hclust")

mtcars_cor_p <- corr.test(mtcars)
class(mtcars_cor_p)
str(mtcars_cor_p)

mtcars_cor_p$r
mtcars_cor_p$p

corrplot(corr = mtcars_cor_p$r,
         p.mat = mtcars_cor_p$p,
         method = "color",
         order = "hclust")
