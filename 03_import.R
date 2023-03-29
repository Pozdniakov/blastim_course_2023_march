read.csv("data/heroes_information.csv")
read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")

install.packages("googlesheets4")
library(googlesheets4)
read_sheet("https://docs.google.com/spreadsheets/d/1JnkftX8H2n383V6wFBTKBqiMmj79hravsYcSeClSeo8/edit?usp=sharing")
?read.csv

read.table("data/heroes_information.csv",
           header = TRUE,
           sep = ",",
           quote = "\"",
           dec = ".")

read.table("data/heroes_information.csv",
           header = TRUE,
           sep = ",",
           quote = "",
           dec = ".")

heroes <- read.csv("data/heroes_information.csv")

heroes <- read.csv("data/heroes_information.csv",
                   na.strings = c("NA", "-", "-99", "", " "))

heroes_failed <- read.csv2("data/heroes_information.csv",
                           na.strings = c("NA", "-", "-99", "", " "))

heroes_dc <- heroes[heroes$Publisher == "DC Comics",]
write.csv(heroes_dc,
          "data/heroes_dc.csv",
          row.names = FALSE)

#heroes$X <- NULL
install.packages("readxl")
install.packages("haven")

vroom::vroom("data/heroes_information.csv")
data.table::fread("data/heroes_information.csv")
