library(tidyverse)

new_diet_wide <-  tribble(
  ~name,    ~before_R, ~after_R,
  "Ираклий",       89,      119,
  "Герман",        56,       36,
  "Кеша",         100,      101
)

new_diet_wide %>%
  pivot_longer(cols = before_R:after_R,
               names_to = "measurement_time",
               values_to = "weight") %>%
  pivot_wider(names_from = "measurement_time",
              values_from = "weight")

heroes <- read_csv("data/heroes_information.csv", na = c("NA", "-", "-99", ""))

heroes %>%
  group_by(Gender) %>%
  summarise(height = mean(Height, na.rm = TRUE),
            weight = mean(Weight, na.rm = TRUE))

lapply(heroes, class)

heroes %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight),
                   mean, na.rm = TRUE)
            )

heroes %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight),
                   function(x) mean(x, na.rm = TRUE))
  )

heroes %>%
  group_by(Gender) %>%
  summarise(across(where(is.numeric),
                   function(x) mean(x, na.rm = TRUE))
  )

heroes %>%
  group_by(Gender) %>%
  summarise(across(where(is.character),
                   function(x) mean(nchar(x), na.rm = TRUE))
  )

heroes %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight),
                   list(minimum = min,
                        median = median,
                        average = mean,
                        maximum = max),
                   na.rm = TRUE
                  ),
            across(where(is.character),
                   function(x) mean(nchar(x), na.rm = TRUE)
                  )
            )

normalize <- function(x) (x - min(x))/(max(x) - min(x))
normalize(1:10)

iris %>%
  mutate(across(where(is.numeric),
                normalize))

