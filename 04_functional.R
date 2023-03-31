
# Условные конструкции ----------------------------------------------------


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

# Создание функций --------------------------------------------------------

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


# Семейство apply() -------------------------------------------------------

A <- matrix(1:12, nrow = 4)
rowSums(A)
rowMeans(A)
colSums(A)
colMeans(A)
apply(A, 2, sum)
apply(A, 1, min)
A[2, 3] <- NA
A
apply(A, 2, mean)
apply(A, 2, mean, na.rm = TRUE)

apply(A, 1, function(x) sum((x - mean(x, na.rm= TRUE)) ^ 2) )

some_list <- list(some_numbers = 1:10,
                  some_letters = letters)
lapply(some_list, length)
sapply(some_list, length)

unlist(lapply(some_list, length))

sapply(1:10, sqrt)
sqrt(1:10)

is_prime <- function(x) sum(x %% seq_len(x) == 0) == 2
is_prime(23)

is_prime(1:10)
is_prime_vectorized <- Vectorize(is_prime)

which(sapply(1:100, is_prime))

replicate(100, mean(rnorm(30)))

#install.packages("purrr")
library(purrr)

map(some_list, length)
map_chr(some_list, length)
map(some_list, 2)
