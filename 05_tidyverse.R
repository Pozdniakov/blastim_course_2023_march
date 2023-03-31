library(data.table)
heroes_dt <- fread("data/heroes_information.csv",
      na.strings = c("NA", "-", "-99", ""))

class(heroes_dt)
attributes(heroes_dt)
head(heroes_dt)
nrow(heroes_dt)

heroes_dt[Alignment == "good",
          .(mean_height = mean(Height, na.rm = TRUE)),
          by = Gender][order(-mean_height)]

library(tidyverse)
heroes_tbl <- read_csv("data/heroes_information.csv", na = c("NA", "-", "-99", ""))
class(heroes_tbl)

heroes_tbl %>%
  filter(Alignment == "good") %>%
  group_by(Gender) %>%
  summarise(mean_height = mean(Height, na.rm = TRUE)) %>%
  arrange(desc(mean_height))

install.packages("tidyverse")
heroes_tbl

sum(sqrt(abs(sin(1:22))))

1:22 %>%
  sin() %>%
  abs() %>%
  sqrt() %>%
  log(8, base = .)

1:22 |>
  sin() |>
  abs() |>
  sqrt() |>
  log(8, base = _)

2 %>%
  c("Корень", ., "равен", sqrt(.))

10:39 %>%
  matrix(nrow = 5) %>%
  apply(2, mean)

heroes <- read_csv("data/heroes_information.csv",
                   na = c("NA", "-", "-99", ""))

heroes %>%
  select(1, 5)

heroes %>%
  select(name, Race, Publisher, `Hair color`)

select(heroes, name, Race, Publisher, `Hair color`)
# `1 СЛОВНО...` <- 3
# `1 СЛОВНО...`

heroes_selected_columns <- heroes %>%
  select(name:Publisher)

heroes %>%
  select(name:`Eye color`, Publisher:Weight)

heroes %>%
  select(!...1)

heroes %>%
  select(!(Gender:Height))

heroes %>%
  select(name:last_col())

heroes %>%
  select(Height, Weight, everything())

heroes %>%
  select(Universe = Publisher)

heroes %>%
  select(ends_with("color"))

heroes %>%
  select(starts_with("Eye") & ends_with("color"))

heroes %>%
  select(contains("eight"))

heroes %>%
  select(where(is.numeric))

heroes %>%
  select(is.numeric)

heroes %>%
  select(where(function(x) !any(is.na(x)) ))

# {function(x) x ^ 2}(3)
# 3 ^ 2
# {2 + 2
# 3 + 4}

heroes %>%
  rename(id = ...1)

heroes %>%
  rename_with(make.names)

heroes %>%
  rename_with(toupper)

heroes %>%
  rename_with(function(x) paste0("prefix_", x))

heroes %>%
  relocate(Publisher)

heroes %>%
  relocate(Publisher, .after = name)

heroes %>%
  relocate(Publisher, .before = name)

heroes %>%
  relocate(Publisher, where(is.numeric), .after = name)

heroes %>%
  relocate(Universe = Publisher, where(is.numeric), .after = name)

heroes %>%
  select(Height)

heroes %>%
  select(Height) %>%
  pull()

heroes %>%
  pull(Height)

heroes %>%
  pull(Height, name)

heroes %>%
  slice(200:205)

heroes %>%
  filter(Publisher == "DC Comics")

heroes %>%
  filter(Publisher == "DC Comics" & Gender == "Female")

heroes %>%
  filter(Publisher == "DC Comics", Gender == "Female")

heroes %>%
  filter(Publisher == "DC Comics") %>%
  filter(Gender == "Female")

heroes %>%
  slice_min(Weight, n = 3) %>%
  relocate(Weight, .after = name)

heroes %>%
  slice_max(Weight, n = 10, with_ties = FALSE) %>%
  relocate(Weight, .after = name)

heroes %>%
  slice_sample(n = 3)

heroes %>%
  slice_sample(prop = .1)

heroes %>%
  slice_sample(prop = 1)

heroes %>%
  tidyr::drop_na()

heroes %>%
  drop_na(Height, Weight)

heroes %>%
  distinct()

heroes %>%
  distinct(Gender, Alignment)

heroes %>%
  arrange(Weight)

heroes %>%
  arrange(desc(Height))

heroes %>%
  arrange(Gender, Weight)

heroes %>%
  mutate(imt = Weight/(Height / 100) ^ 2, .after = name)

heroes %>%
  transmute(name, Publisher, imt = Weight/(Height / 100) ^ 2)

heroes %>%
  mutate(boldness = ifelse(`Hair color` == "No Hair", "Bold", "Hairy")) %>%
  select(name, Publisher, `Hair color`, boldness)

heroes %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE),
            min_weight = min(Weight, na.rm = TRUE),
            max_weight = max(Weight, na.rm = TRUE))

heroes %>%
  summarise(range_weight = range(Weight, na.rm = TRUE))

mean(heroes$Weight, na.rm = TRUE)

heroes %>%
  group_by(Gender) %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE),
            min_weight = min(Weight, na.rm = TRUE),
            max_weight = max(Weight, na.rm = TRUE))

heroes %>%
  group_by(Gender) %>%
  mutate(mean_weight = mean(Weight, na.rm = TRUE), .after = name) %>%
  mutate(diff_weight_by_gender = Weight - mean_weight,
         .before = Gender) %>%
  relocate(Weight, .after = mean_weight)

heroes %>%
  group_by(Race) %>%
  filter(n() > 10)

heroes %>%
  group_by(Race) %>%
  filter(n() == 1)

heroes %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE),
            min_weight = min(Weight, na.rm = TRUE),
            max_weight = max(Weight, na.rm = TRUE),
            .by = Gender)

heroes %>%
  group_by(Gender) %>%
  mutate(mean_weight = mean(Weight, na.rm = TRUE), .after = name) %>%
  mutate(diff_weight_by_gender = Weight - mean_weight,
         .before = Gender) %>%
  relocate(Weight, .after = mean_weight) %>%
  ungroup()

heroes %>%
  group_by(Gender) %>%
  summarise(n = n())

heroes %>%
  count(Gender)

heroes %>%
  count(Gender, Alignment, sort = TRUE)

dc <- heroes %>%
  filter(Publisher == "DC Comics") %>%
  group_by(Gender) %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE))

marvel <- heroes %>%
  filter(Publisher == "Marvel Comics") %>%
  group_by(Gender) %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE))

others <- heroes %>%
  filter(!Publisher %in% c("Marvel Comics", "DC Comics")) %>%
  group_by(Gender) %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE))

bind_rows(dc, marvel, others)
bind_cols(dc, marvel, others)

list_of_df <- list(DC = dc, Marvel = marvel, Other_publishers = others)
bind_rows(list_of_df, .id = "Publisher")

band_members
band_instruments

full_join(band_members, band_instruments, by = "name")
inner_join(band_members, band_instruments, by = "name")

left_join(band_members, band_instruments)
band_members %>%
  left_join(band_instruments)

band_members %>%
  semi_join(band_instruments, by = "name")

band_members %>%
  anti_join(band_instruments)

band_instruments %>%
  anti_join(band_members)

band_members
band_instruments2

band_members %>%
  left_join(band_instruments2, by = c("name" = "artist"))
