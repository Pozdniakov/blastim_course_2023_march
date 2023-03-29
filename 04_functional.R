n <- 1
if (n > 0) {
  "Positive number"
} else {
  "Negative number or 0"
  }

n <- 0
if (n > 0) {
  "Positive number"
} else if (n < 0) {
  "Negative number"
} else {
  "0"
}

n <- -2:2

if (n > 0) {
  "Positive number"
} else if (n < 0) {
  "Negative number"
} else {
  "0"
}
n
ifelse(n > 0, "Positive number", "Negative number or 0")

ifelse(n > 0,
       "Positive number",
       ifelse(n < 0,
              "Negative number",
              "Zero"))

#install.packages("dplyr")
dplyr::case_when(
  n > 0  ~ "Positive number", #if
  n < 0  ~ "Negative number", #else if
  is.na(n) ~ NA,              #else if
  .default = "Zero"           #else
)

pow <- function(x, p) {
  power <- x ^ p
  return(power)
}
pow(3, 2)

pow <- function(x, p) x ^ p
pow(3, 2)

pow <- function(x, p = 2) x ^ p
pow(10, 4)
pow()

m <- 120
h <- 1.8

imt <- function(m, h) m / h ^ 2

rm(m, h)
imt(m = 100, h = 1.6)
